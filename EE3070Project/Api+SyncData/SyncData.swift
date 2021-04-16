//
//  SyncData.swift
//  TabBarAppTemplate+LoginScreen
//
//  Created by Bowie Tso on 9/4/2021.
//
import Foundation
import RealmSwift
import Alamofire
import ObjectMapper
import SwiftyJSON
import FirebaseFirestore
import FirebaseCore
import Firebase
import AlamofireObjectMapper

enum SyncDataFailReason: Error {
  case network
  case realmWrite
  case other
}


class SyncData {
    
    var db = Firestore.firestore()
    static var firstSync : Bool  = false
    
    static var realmBackgroundQueue = DispatchQueue(label: ".realm", qos: .background)
    
    static func writeRealmAsync(_ write: @escaping (_ realm: Realm) -> Void,
                                completed: (() -> Void)? = nil) {
      SyncData.realmBackgroundQueue.async {
        autoreleasepool {
          do {
            let realm = try Realm()
            realm.beginWrite()
            write(realm)
            try realm.commitWrite()

            if let completed = completed {
              DispatchQueue.main.async {
                let mainThreadRealm = try? Realm()
                mainThreadRealm?.refresh() // Get updateds from Background thread
                completed()
              }
            }
      } catch {
            print("writeRealmAsync Exception \(error)")
          }
        }
      }
    }
    
    func failReason(error: Error?, resposne: Any?) -> SyncDataFailReason {
      if let error = error as NSError?, error.domain == NSURLErrorDomain {
        return .network
      }
      return .other
    }
    
    func syncProducts(completed:((SyncDataFailReason?) -> Void)?) {
        let ref = db.collection("products")
        ref.getDocuments{ (querySnapshot, error) in
            if let querySnapshot = querySnapshot {
                SyncData.writeRealmAsync({ (realm) in
                    realm.delete(realm.objects(Product.self))
                    for document in querySnapshot.documents {
                        let dict = document.data() as NSDictionary
//                        JSONSerialization().
//                            print(JSON(document.data()))
//                        realm.delete(realm.objects(Member.self))
                        realm.add(Product(JSON: document.data())!)
                        print(realm.objects(Product.self)[0])
                            
                    }
//                        print(realm.objects(Product.self))
                }, completed:{
                        completed?(nil)
                })
                
            }
        }
    }
    
    func syncUser(completed:((SyncDataFailReason?) -> Void)?) {
        let ref = db.collection("users")
        ref.whereField("uid", isEqualTo: Auth.auth().currentUser?.uid).getDocuments{ (querySnapshot, error) in
            if let querySnapshot = querySnapshot {
                for document in querySnapshot.documents {
                    SyncData.writeRealmAsync({ (realm) in
                        let dict = document.data() as NSDictionary
//                        JSONSerialization().
                        realm.delete(realm.objects(Member.self))
                        realm.add(Member(JSON: document.data())!)
                        }, completed:{
                            completed?(nil)
                          })
                }
            }
        }
    }
}

extension NSDictionary{
    func JsonString() -> String
    {
        do{
        let jsonData: Data = try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
        return String.init(data: jsonData, encoding: .utf8)!
        }
        catch
        {
            return "error converting"
        }
    }
}

extension String{
func dictionaryValue() -> [String: AnyObject]
{
    if let data = self.data(using: String.Encoding.utf8) {
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as? [String: AnyObject]
            return json!

        } catch {
            print("Error converting to JSON")
        }
    }
    return NSDictionary() as! [String : AnyObject]
} }
