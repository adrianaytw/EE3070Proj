//
//  StartViewController.swift
//  EE3070Project
//
//  Created by Bowie Tso on 10/4/2021.
//

import UIKit

class StartViewController: BaseViewController {

    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    
    var rootRouter: RootRouter? {
       return router as? RootRouter
     }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func loginClicked(_ sender: Any) {
        rootRouter?.showLogin()
    }
    
    @IBAction func signInClicked(_ sender: Any) {
        rootRouter?.showSignIn()
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
