//
//  RootNavigationController.swift
//  TabBarAppTemplate+LoginScreen
//
//  Created by Bowie Tso on 18/3/2021.
//

import UIKit

class RootNavigationController: UINavigationController {

    var router: RootRouter?
        
    override func viewDidLoad() {
           super.viewDidLoad()
           router = RootRouter(self)
                router?.showSearch(animated: true)
    
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
