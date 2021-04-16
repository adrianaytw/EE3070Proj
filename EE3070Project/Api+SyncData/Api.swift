//
//  Api.swift
//  TabBarAppTemplate+LoginScreen
//
//  Created by Bowie Tso on 9/4/2021.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class Api {
  static let requestBasePath = "https://firestore.googleapis.com/v1/projects/designproj3070/databases/(default)/"
//    static let requestBasePath = "http://144.214.94.36:8000/catalog/api/"
//
//  static let ReceiveApiErrorNotification = NSNotification.Name.init("ReceiveApiErrorNotification")
//  static let ErrorCodeRemoteSignout = 214
//  static let ErrorCodeMaintanceMode = 1001

//  lazy var sessionManager = SessionManager.shared
  
  // MARK: - Common
  func stopAllRunningRequest() {
    Alamofire.SessionManager.default.session.getAllTasks { (tasks) in
      tasks.forEach({ $0.cancel() })
    }
  }
    func get<U>(_ path: String,
                responseClass: ArduinoResponse<U>.Type,
                parameters: Parameters = Parameters(),
                success: @escaping (_ payload: U?) -> Void,
                fail: @escaping (_ errr: Error?, _ response: ArduinoResponse<U>?) -> Void ) {
      
      var param = parameters
//      if tokenNeeded {
//        param["token"] = sessionManager.userToken
//      }
      Alamofire.request(path, method: .get, parameters: param)
        .responseObject { (response: DataResponse<ArduinoResponse<U>>) in
//          #if DEVELOPMENT
            print("🌏 Success: \(response.result.isSuccess)" +
                    "Request \(String(describing: response.request?.url)) " +
              "Err: \(String(describing: response.error)) ")
//          #endif
          
          if response.result.isSuccess {
            let responseObject = response.result.value
            
            if responseObject?.success ?? false {
                success(responseObject?.value)
            }

              else {
                fail(nil, responseObject)
              
            }
          } else {
            fail(response.error, response.result.value)  // E.g. No Network
          }
      }
    }
    
    func post<U, T: ArduinoResponse<U>>(_ path: String,
                                    responseClass: T.Type,
                                    parameters: Parameters?,
                                    success: @escaping (_ payload: U?) -> Void,
                                    fail: @escaping (_ errr: Error?, _ response: T? ) -> Void ) {
      
      Alamofire.request(path, method: HTTPMethod.post, parameters: parameters, encoding: JSONEncoding.default)
        .responseObject { (response: DataResponse<T>) in
//          #if DEVELOPMENT
          print("🌏 Success: \(response.result.isSuccess)" +
              "Request \(String(describing: response.request?.url)) " +
              "Err: \(String(describing: response.error)) ")
//          #endif
          
          if response.result.isSuccess {
            let responseObject: T? = response.result.value
            
            if responseObject?.success ?? false {
              success(responseObject?.value)
            } else {
              fail(nil, responseObject)
            }
          } else {
            fail(response.error, response.result.value)  // E.g. No Network
          }
      }
    }
    
//    func updateDisplayName(name:String, sid: String, success: @escaping (_ payload: Student?) -> Void,
//                           fail: @escaping (_ error: Error?, ArduinoResponse<Student>?) -> Void) {
//        var postBody = Parameters()
//        postBody["display_name"] = name
//            post("\(Api.requestBasePath)updateDisplayName/\(sid)",
//                responseClass: ArduinoResponse<Student>.self, parameters: postBody,
//                success: success, fail: fail
//            )
//    }
//
//    func getStudentInfo(sid:String, success: @escaping (_ payload: Student?) -> Void,
//                        fail: @escaping (_ error: Error?, CMSResponse<Student>?) -> Void) {
//         get("\(Api.requestBasePath)getStudentInfo/\(sid)",
//           responseClass: ArduinoResponse<Student>.self,
//           success: success, fail: fail
//         )
//    }
}
