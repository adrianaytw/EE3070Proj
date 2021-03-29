//
//  HomeViewController.swift
//  TabBarAppTemplate+LoginScreen
//
//  Created by Bowie Tso on 18/3/2021.
//

import UIKit

class SearchViewController: BaseViewController {

    @IBOutlet weak var testButton: UIButton!
    
    var rootRouter: RootRouter? {
       return router as? RootRouter
     }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiInit()

        // Do any additional setup after loading the view.
    }
    
    func uiInit(){
        testButton.backgroundColor = UIColor.yellow
    
    }

    @IBAction func testClicked(_ sender: Any) {
        rootRouter?.showTest2()
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
