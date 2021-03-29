//
//  UIStoryBoard+Create.swift
//  TabBarAppTemplate+LoginScreen
//
//  Created by Bowie Tso on 18/3/2021.
//
import UIKit
extension UIStoryboard {
    enum Storyboard: String {
        case main = "Main"
        case more = "More"
        case login = "Login"
    }

 static func storyboard(_ storyboard: Storyboard) -> UIStoryboard {
    return UIStoryboard.init(name: storyboard.rawValue, bundle: nil)
  }

  func instantiateViewController<T: UIViewController>(_ vcClass: T.Type) -> T? {
    let viewControllerTypeName: String = String(describing: T.self)
    guard let vc = instantiateViewController(withIdentifier: viewControllerTypeName) as? T else {
      fatalError("Could not locate viewcontroller with with identifier \(viewControllerTypeName) in storyboard.")
    }
    return vc
  }
}
