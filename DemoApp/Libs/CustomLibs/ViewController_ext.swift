//
//  ViewControler_ext.swift
//  DemoApp
//
//  Created by Jagdeep Singh on 13/03/18.
//  Copyright © 2018 Jk. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func addChild(_ vc: UIViewController, to subView:UIView){
        self.addChildViewController(vc)
        subView.addSubview(vc.view)
        vc.view.addConstraintToFillSuperview()
        vc.didMove(toParentViewController: self)
    }
    
    func findContentViewControllerRecursively() -> UIViewController {
        var childViewController: UIViewController?
        if (self is UITabBarController) {
            childViewController = (self as? UITabBarController)?.selectedViewController
        }
        else if (self is UINavigationController) {
            childViewController = (self as? UINavigationController)?.topViewController
        }
        else if (self is UISplitViewController) {
            childViewController = (self as? UISplitViewController)?.viewControllers.last
        }
        else if (self.presentedViewController != nil) {
            childViewController = self.presentedViewController
        }
        let shouldContinueSearch: Bool = (childViewController != nil) && !((childViewController?.isKind(of: UIAlertController.self))!)
        return shouldContinueSearch ? childViewController!.findContentViewControllerRecursively() : self
    }
    
    func pushWith(identifier:String) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: identifier)
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
