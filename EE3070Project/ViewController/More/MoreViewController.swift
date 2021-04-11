//
//  MoreViewController.swift
//  TabBarAppTemplate+LoginScreen
//
//  Created by Bowie Tso on 18/3/2021.
//

import UIKit
import Firebase
import FirebaseAuth

class MoreViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    var settingContentList = ["Terms","Logout","Reset Password"]
    
    var rootRouter: RootRouter? {
       return router as? RootRouter
     }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      tableView.deselectRow(at: indexPath, animated: true)
        if(indexPath.row == 1){
            let controller = UIAlertController(title: "Confirm Logout?", message: "All Data that stored in local will be removed and will not be Recovered.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
                self.logout()

            }
            controller.addAction(okAction)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            controller.addAction(cancelAction)
            present(controller, animated: true, completion: nil)
            
        }else if(indexPath.row == 2){
            let controller = UIAlertController(title: "Confirm Reset Password?", message: "All data that stored in local will be removed and will not be Recovered.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
                self.rootRouter?.showReset()
            }
            controller.addAction(okAction)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            controller.addAction(cancelAction)
            present(controller, animated: true, completion: nil)
            
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  self.settingContentList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cellIdentifier = "SettingTableViewCell"
      guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? SettingTableViewCell else {
        fatalError("The dequeued cell is not an instance of SettingTableViewCell.")
      }
        cell.settingLabel.text = self.settingContentList[indexPath.row]
        return cell
    }
    
    func logout(){
        
        do {
            try Auth.auth().signOut()
        }
             catch let signOutError as NSError {
                    print ("Error signing out: %@", signOutError)
        }
        
        UserDefaults.standard.set("", forKey: "memberId")
//        SyncData.writeRealmAsync({ (realm) in
//            realm.delete(realm.objects(Student.self))
//            realm.delete(realm.objects(Attendance.self))
//        }, completed:{
//          })
        self.navigationController?.popToRootViewController(animated: true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let initial = storyboard.instantiateInitialViewController()
        UIApplication.shared.keyWindow?.rootViewController = initial
    }
     
}
