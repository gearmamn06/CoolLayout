//
//  UIViewController+Extension.swift
//  CoolLayout
//
//  Created by sudo.park on 19/10/2019.
//

import UIKit

// MARK: extension for < swift 5.1 -> UIViewController extension에서 쓰는걸로 통일

extension NSCoding where Self: UIViewController {
    
    public static var instance: Self {
        return instance()
    }
}

extension UIViewController {
    
    public static func instance<T: UIViewController>(_ initClosure: ((UIViewController) -> Void)? = nil) -> T {
        let controller = T.init()
        initClosure?(controller)
        return controller
    }
}
