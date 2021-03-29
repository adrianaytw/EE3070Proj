//
//  ViewController.swift
//  TabBarAppTemplate+LoginScreen
//
//  .
//

import UIKit

class BaseViewController: UIViewController {
    var clearColorNavigationBar: Bool = false
    var hideNavigationBarShadow: Bool = false
    
    
    // Store a navBar reference for un-doing navBar style change after navigationController == nil
    weak var modifiedNavigationBar: UINavigationBar?
    
    var router: Router?
    
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView?
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftItemsSupplementBackButton = true
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = UIColor.white
    }
    
    func startLoading() {
      loadingIndicator?.startAnimating()
      loadingIndicator?.isHidden = false
    }

    func stopLoading() {
      loadingIndicator?.isHidden = true
    }

    func isLoading() -> Bool {
      return !(loadingIndicator?.isHidden ?? true)
    }


}

