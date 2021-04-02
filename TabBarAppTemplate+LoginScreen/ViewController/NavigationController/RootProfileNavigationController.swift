//
//  RootProfileNavigationController.swift
//  TabBarAppTemplate+LoginScreen
//
//  Created by Bowie Tso on 2/4/2021.
//

import UIKit

class RootProfileNavigationController: UINavigationController {

    var router: RootRouter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        router = RootRouter(self)
        router?.showProfile()
        // Do any additional setup after loading the view.
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
