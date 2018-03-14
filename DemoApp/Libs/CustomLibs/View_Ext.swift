//
//  View_Ext.swift
//  DemoApp
//
//  Created by Jagdeep Singh on 13/03/18.
//  Copyright © 2018 Jk. All rights reserved.
//

import UIKit

extension UIView {

    func addConstraintToFillSuperview() {
        superview?.addVisualConstraints(["H:|[self]|", "V:|[self]|"], subviews: ["self": self])
    }

    func addVisualConstraints(_ constraints: [String], subviews: [String: UIView]) {
        addVisualConstraints(constraints, metrics: nil, forSubviews: subviews)
    }
    
    func addVisualConstraints(_ constraints: [String], metrics: [String: Any]?, forSubviews subviews: [String: UIView]) {
        // Disable autoresizing masks translation for all subviews
        for subview in subviews.values {
            if subview.responds(to: #selector(setter: self.translatesAutoresizingMaskIntoConstraints)) {
                subview.translatesAutoresizingMaskIntoConstraints = false
            }
        }
        // Apply all constraints
        for constraint in constraints {
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: constraint, options: [], metrics: metrics, views: subviews))
        }
    }
    
}
