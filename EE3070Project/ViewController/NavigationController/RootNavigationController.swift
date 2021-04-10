//
//  RootNavigationController.swift
//  TabBarAppTemplate+LoginScreen
//
//  Created by Bowie Tso on 18/3/2021.
//

import UIKit
import FirebaseAuth
import Firebase

class RootNavigationController: UINavigationController {

    var router: RootRouter?
        
    override func viewDidLoad() {
           super.viewDidLoad()
           router = RootRouter(self)
        if(Auth.auth().currentUser != nil){
                router?.showSearch(animated: true)
        }else{
            router?.showStart()
        }
            }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
