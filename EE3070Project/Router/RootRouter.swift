//
//  RootRouter.swift
//  TabBarAppTemplate+LoginScreen
//
//  Created by Bowie Tso on 18/3/2021.
//
import UIKit

class RootRouter: Router{
    
    //use root router to show screen
    
    var moreNavigationController: UINavigationController? {
        return RootMoreNavigationController() as? UINavigationController
    }
    
    func showStart(){
        guard
          let startViewController = UIStoryboard.storyboard(.login).instantiateViewController(StartViewController.self) else {
            return
        }

        startViewController.router = self
        startViewController.modalPresentationStyle = .fullScreen
        startViewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(startViewController, animated: false)
    }
    
    func showLogin(){
        guard
          let loginViewController = UIStoryboard.storyboard(.login).instantiateViewController(LoginViewController.self) else {
            return
        }

        loginViewController.router = self
//        loginViewController.hidesBottomBarWhenPushed = true
        loginViewController.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(loginViewController, animated: true)
    }
    
    func showSignIn(){
        guard
          let signInViewController = UIStoryboard.storyboard(.login).instantiateViewController(SignInViewController.self) else {
            return
        }

        signInViewController.router = self
//        signInViewController.hidesBottomBarWhenPushed = true
        signInViewController.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(signInViewController, animated: true)
    }
    
    func showSearch(animated: Bool, complete: (() -> Void)? = nil ){
        guard
          let searchViewController = UIStoryboard.storyboard(.main).instantiateViewController(SearchViewController.self) else {
            return
        }
        //        let homeNavigationController = BaseNavigationController.init(rootViewController: homeViewController)
        searchViewController.router = self
        //navigationController?.setNavigationBarHidden(true, animated: animated)
    //        homeViewController.modalPresentationStyle = .fullScreen
        searchViewController.navigationController?.navigationBar.backItem?.hidesBackButton = false
        searchViewController.hidesBottomBarWhenPushed = false
        navigationController?.pushViewController(searchViewController, animated: false)
    }
    
    func showProductDetail(product: Product){
        guard
            let productDetailViewController = UIStoryboard.storyboard(.main).instantiateViewController(ProductDetailViewController.self) else {
              return
          }
          
        productDetailViewController.router = self
        productDetailViewController.product = product
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.pushViewController(productDetailViewController, animated: true)
    }
    
    

    func showTest(){
        guard
            let testViewController = UIStoryboard.storyboard(.main).instantiateViewController(TestViewController.self) else {
              return
          }
          
        testViewController.router = self
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.pushViewController(testViewController, animated: true)
    }
    
    func showMore(){
        guard
            let moreViewController = UIStoryboard.storyboard(.more).instantiateViewController(MoreViewController.self) else { // UIStoryboard.storyboard(.more) mean using More storyboard
            return
        }
        //        let homeNavigationController = BaseNavigationController.init(rootViewController: homeViewController)
//        moreViewController.router = MoreRouter(moreNavigationController!)
        moreViewController.router = self
        //navigationController?.setNavigationBarHidden(true, animated: false)
        navigationController?.pushViewController(moreViewController, animated: false)
    }
    
    func showRecord(){
        guard
            let recordViewController = UIStoryboard.storyboard(.record).instantiateViewController(RecordViewController.self) else { // UIStoryboard.storyboard(.more) mean using More storyboard
            return
        }
        //        let homeNavigationController = BaseNavigationController.init(rootViewController: homeViewController)
//        moreViewController.router = MoreRouter(moreNavigationController!)
        recordViewController.router = self
        //navigationController?.setNavigationBarHidden(true, animated: false)
        navigationController?.pushViewController(recordViewController, animated: false)
    }
    
    func showProfile(){
        guard
            let profileViewController = UIStoryboard.storyboard(.main).instantiateViewController(ProfileViewController.self) else { // UIStoryboard.storyboard(.more) mean using More storyboard
            return
        }
        //        let homeNavigationController = BaseNavigationController.init(rootViewController: homeViewController)
//        moreViewController.router = MoreRouter(moreNavigationController!)
        profileViewController.router = self
        //navigationController?.setNavigationBarHidden(true, animated: false)
        navigationController?.pushViewController(profileViewController, animated: false)
    }
    
    func showTest2(){
        guard
            let test2ViewController = UIStoryboard.storyboard(.main).instantiateViewController(Test2ViewController.self) else { // UIStoryboard.storyboard(.more) mean using More storyboard
            return
        }
        //        let homeNavigationController = BaseNavigationController.init(rootViewController: homeViewController)
//        moreViewController.router = MoreRouter(moreNavigationController!)
        test2ViewController.router = self
        //navigationController?.setNavigationBarHidden(true, animated: false)
        navigationController?.pushViewController(test2ViewController, animated: false)
    }
    
    


}
