//
//  UIView+AutoLayoutHelpers.swift
//  airUtilities
//
//  Created by Steven Thompson on 2017-07-18.
//  Copyright © 2017 airg. All rights reserved.
//

import UIKit

public extension UIView {
    /// Fill self with the provided view.
    ///
    /// - parameter view: View to pin to edges. Must already be in the view hierarchy.
    public func fill(with view: UIView) -> Void {
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[view]|", options: [], metrics: nil, views: ["view": view]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|", options: [], metrics: nil, views: ["view": view]))
    }

    /// Constrain size of self to a specific width and height.
    ///
    /// - parameter width:
    /// - parameter height:
    public func constrainSize(width: CGFloat, height: CGFloat) {
        addConstraint(NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: width))
        addConstraint(NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: height))
    }

    /// Constrain height of self.
    ///
    /// - parameter height:
    public func constrainHeight(to height: CGFloat) {
        addConstraint(NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: height))
    }

    /// Constrain width of self.
    ///
    /// - parameter width:
    public func constrainWidth(to width: CGFloat) {
        addConstraint(NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: width))
    }

    /// Align centerX and centerY of `view` to `self`.
    ///
    /// - parameter view: View to constrain. Must already be in the view hierarchy
    public func center(on view: UIView) {
        addConstraint(NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1.0, constant: 0.0))
        addConstraint(NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0.0))
    }
}
