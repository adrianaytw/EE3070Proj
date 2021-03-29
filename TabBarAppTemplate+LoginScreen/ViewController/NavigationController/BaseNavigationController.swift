//
//  BaseNavigationController.swift
//  TabBarAppTemplate+LoginScreen
//
//  Created by Bowie Tso on 18/3/2021.
//

import UIKit

class BaseNavigationController: UINavigationController {
      var router: Router? {
        didSet {
          // Pass the router into TopViewController
          if let topVC = topViewController as? BaseViewController {
            topVC.router = router
          }
            
        }
      }

      override func viewDidLoad() {
        super.viewDidLoad()

        automaticallyAdjustsScrollViewInsets = true
        
      }

      override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
      }
    }
