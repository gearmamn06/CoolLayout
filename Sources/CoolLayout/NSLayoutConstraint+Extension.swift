//
//  NSLayoutConstraint+Extension.swift
//  AutoLayoutFormula
//
//  Created by ParkHyunsoo on 2019/10/13.
//

import UIKit

public extension NSLayoutConstraint {
    
    func updateMultiply(_ newValue: CGFloat, shouldUpdate: Bool = false) -> NSLayoutConstraint {
        
        if self.isActive {
            NSLayoutConstraint.deactivate([self])
        }
        
        let newConstraint = NSLayoutConstraint(item: firstItem,
                                               attribute: firstAttribute,
                                               relatedBy: relation,
                                               toItem: secondItem,
                                               attribute: secondAttribute,
                                               multiplier: newValue,
                                               constant: constant)
        newConstraint.priority = priority
        newConstraint.shouldBeArchived = shouldBeArchived
        newConstraint.identifier = identifier
        
        if shouldUpdate {
            NSLayoutConstraint.activate([newConstraint])
        }
        
        return newConstraint
    }
    
    
    func updateConstant(_ newValue: CGFloat, shouldUpdate: Bool = false) -> NSLayoutConstraint {
        
        if self.isActive {
            NSLayoutConstraint.deactivate([self])
        }
        
        let newConstraint = NSLayoutConstraint(item: firstItem,
                                               attribute: firstAttribute,
                                               relatedBy: relation,
                                               toItem: secondItem,
                                               attribute: secondAttribute,
                                               multiplier: multiplier,
                                               constant: newValue)
        newConstraint.priority = priority
        newConstraint.shouldBeArchived = shouldBeArchived
        newConstraint.identifier = identifier
        
        if shouldUpdate {
            NSLayoutConstraint.activate([newConstraint])
        }
        
        return newConstraint
    }
    
}

