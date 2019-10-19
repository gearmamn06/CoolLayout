//
//  UIView+Extension.swift
//  CoolLayout
//
//  Created by sudo.park on 19/10/2019.
//

import UIKit

// MARK: extension for < swift 5.1

extension NSCoding where Self: UIView {

    
    public static var cool: Self {
        let view = self.init()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    public static func cool(_ decorating: ((Self) -> Void)? = nil) -> Self {
        let view = cool
        decorating?(view)
        return view
    }
    
    public static func cool(_ docoratings: ((Self) -> Void)...) -> Self {
        let view = cool
        docoratings.forEach {
            $0(view)
        }
        return view
    }
    
    public func apply(_ decorating: (Self) -> Void) {
        decorating(self)
    }
    
    public func apply(_ decoratings: ((Self) -> Void)...) {
        decoratings.forEach {
            $0(self)
        }
    }

    public func apply(_ decoratings: [(Self) -> Void]) {
        decoratings.forEach {
            $0(self)
        }
    }
    
//    func apply()
    
    @discardableResult
    public static func << (_ view: Self, decorating: (Self) -> Void) -> Self {
        decorating(view)
        return view
    }
    
    @discardableResult
    public static func + (view: Self, next: (UIView) -> Void) -> Self {
        next(view)
        return view
    }
    
    @discardableResult
    public static func + (view: Self, next: (Self) -> Void) -> Self {
        next(view)
        return view
    }
}


public extension UIView {
    
    
    
}
