//
//  MoreViewController.swift
//  TabBarAppTemplate+LoginScreen
//
//  Created by Bowie Tso on 18/3/2021.
//

import UIKit

class MoreViewController: BaseViewController {
    
    
    @IBOutlet weak var passwordbutton: UIButton!
    var rootRouter: RootRouter? {
       return router as? RootRouter
     }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
    @IBAction func passwordClicked(_ sender: UIButton) {
        rootRouter?.showTest()

        
    }
    
    
    /*@IBAction func passwordClicked(_ sender: Any) {
        rootRouter?.showTest2()
    }
*/
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
