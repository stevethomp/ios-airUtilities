//
//  Button+ClosureHandler.swift
//  airUtilities
//
//  Created by Steven Thompson on 2017-07-18.
//  Copyright © 2017 airg. All rights reserved.
//

import Foundation

public extension UIButton {
    public typealias EmptyClosure = (() -> Void)

    private struct AssociatedKeys {
        static var UIButtonActionHandlerTapKey = "UIButtonActionHandlerTapKey"
    }

    /// Closure based event handling for `UIButton`. `Handler` will be called when the button receives an event of type `event`.
    ///
    /// - Parameters:
    ///   - event: Event that causes execution.
    ///   - handler: Closure you want executed on event.
    public func handle(_ event: UIControlEvents, with handler: EmptyClosure?) {
        let wrapper = ClosureWrapper(closure: handler)
        objc_setAssociatedObject(self, &AssociatedKeys.UIButtonActionHandlerTapKey, wrapper, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        self.addTarget(self, action: #selector(callHandler(sender:)), for: event)
    }

    /// Closure based event handling for `UIButton`. `Handler` will be called when the button receives an event of type `event`.
    ///
    /// - Parameters:    
    ///   - handler: Closure you want executed on event.
    ///   - event: Event that causes execution.
    public func add(handler: EmptyClosure?, for event: UIControlEvents) {
        handle(event, with: handler)
    }

    @objc private func callHandler(sender: AnyObject) {
        let handler = objc_getAssociatedObject(self, &AssociatedKeys.UIButtonActionHandlerTapKey) as? ClosureWrapper
        handler?.closure?()
    }
}

fileprivate class ClosureWrapper: NSObject, NSCopying {
    var closure: UIButton.EmptyClosure?

    convenience init(closure: UIButton.EmptyClosure?) {
        self.init()
        self.closure = closure
    }

    func copy(with zone: NSZone? = nil) -> Any {
        let wrapper: ClosureWrapper = ClosureWrapper()
        wrapper.closure = closure
        return wrapper
    }
}
