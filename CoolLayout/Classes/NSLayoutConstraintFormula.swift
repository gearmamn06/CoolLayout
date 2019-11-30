//
//  NSLayoutConstraintFormulaTest.swift
//  NSLayoutConstraintFormulaTest
//
//  Created by ParkHyunsoo on 2019/10/13.
//

import UIKit

// TODO: anchor helpers

/**
 x, y : ==, >=, <= with constatnt
 d: ==, >=, <= with constant and multiplier
 */

fileprivate extension NSLayoutConstraint {
    
    private var shouldActive: Bool {
        if let firstView = self.firstItem as? UIView {
            return firstView.shouldActiveWhenConstraintMade
        }
        return false
    }
    
    func activeOrNot() -> NSLayoutConstraint {
        if shouldActive {
            self.isActive = true
        }
        return self
    }
}

public class HalfNSLayoutConstraint<AnchorType: AnyObject> {
    
    unowned(unsafe) let referenceAnchor: NSLayoutAnchor<AnchorType>
    let constant: CGFloat
    let multiplier: CGFloat
    let isSystemSpacingMultiplier: Bool
    
    init(_ anchor: NSLayoutAnchor<AnchorType>, constant: CGFloat = 0.0,
         multiplier: CGFloat = 1.0, isSystemSpacingMultiplier: Bool = false) {
        self.referenceAnchor = anchor
        self.constant = constant
        self.multiplier = multiplier
        self.isSystemSpacingMultiplier = isSystemSpacingMultiplier
    }
}


public func + <AnchorType>(_ anchor: NSLayoutAnchor<AnchorType>,
                    _ constant: CGFloat) -> HalfNSLayoutConstraint<AnchorType> {
    
    return HalfNSLayoutConstraint(anchor, constant: constant)
}

public func * <AnchorType>(_ anchor: NSLayoutAnchor<AnchorType>,
                    _ multiplier: CGFloat) -> HalfNSLayoutConstraint<AnchorType> {
    
    return HalfNSLayoutConstraint(anchor, multiplier: multiplier)
}

@available(iOS 11.0, *)
public func * (_ anchor: NSLayoutXAxisAnchor,
               _ multiplier: CGFloat) -> HalfNSLayoutConstraint<NSLayoutXAxisAnchor> {
    
    return HalfNSLayoutConstraint(anchor, multiplier: multiplier, isSystemSpacingMultiplier: true)
}

@available(iOS 11.0, *)
public func * (_ anchor: NSLayoutYAxisAnchor,
               _ multiplier: CGFloat) -> HalfNSLayoutConstraint<NSLayoutYAxisAnchor> {
    
    return HalfNSLayoutConstraint(anchor, multiplier: multiplier, isSystemSpacingMultiplier: true)
}


public func + (_ half: HalfNSLayoutConstraint<NSLayoutDimension>,
        _ constatnt: CGFloat) -> HalfNSLayoutConstraint<NSLayoutDimension> {
    
    return HalfNSLayoutConstraint(half.referenceAnchor,
                                  constant: half.constant + constatnt,
                                  multiplier: half.multiplier)
}


// MARK: - Equal operation

@discardableResult
public func == <AnchorType>(_ target: NSLayoutAnchor<AnchorType>,
                     _ half: HalfNSLayoutConstraint<AnchorType>) -> NSLayoutConstraint {
    
    if #available(iOS 11.0, *), half.isSystemSpacingMultiplier {
        if let xAxisTarget = target as? NSLayoutXAxisAnchor,
            let halfAnchor = half.referenceAnchor as? NSLayoutXAxisAnchor {
            return xAxisTarget.constraint(equalToSystemSpacingAfter: halfAnchor,
                                          multiplier: half.multiplier).activeOrNot()
        }else if let yAxisTarget = target as? NSLayoutYAxisAnchor,
            let halfAnchor = half.referenceAnchor as? NSLayoutYAxisAnchor {
            return yAxisTarget.constraint(equalToSystemSpacingBelow: halfAnchor,
                                          multiplier: half.multiplier)
                .activeOrNot()
        }
    }
    
    return target.constraint(equalTo: half.referenceAnchor, constant: half.constant)
        .activeOrNot()
}

@discardableResult
public func == (_ target: NSLayoutDimension,
         _ half: HalfNSLayoutConstraint<NSLayoutDimension>) -> NSLayoutConstraint {
    
    return target
        .constraint(equalTo: half.referenceAnchor as! NSLayoutDimension,
                    multiplier: half.multiplier,
                    constant: half.constant)
        .activeOrNot()
}

@discardableResult
public func == (_ target: NSLayoutDimension, _ constant: CGFloat) -> NSLayoutConstraint {
    return target.constraint(equalToConstant: constant)
        .activeOrNot()
}


// MARK: - Less than ro Equal

@discardableResult
public func <= <AnchorType> (_ target: NSLayoutAnchor<AnchorType>,
                      _ half: HalfNSLayoutConstraint<AnchorType>) -> NSLayoutConstraint {
    
    if #available(iOS 11.0, *), half.isSystemSpacingMultiplier {
        if let xAxisTarget = target as? NSLayoutXAxisAnchor,
            let halfAnchor = half.referenceAnchor as? NSLayoutXAxisAnchor {
            return xAxisTarget.constraint(lessThanOrEqualToSystemSpacingAfter: halfAnchor,
                                          multiplier: half.multiplier)
                .activeOrNot()
        }else if let yAxisTarget = target as? NSLayoutYAxisAnchor,
            let halfAnchor = half.referenceAnchor as? NSLayoutYAxisAnchor {
            return yAxisTarget.constraint(lessThanOrEqualToSystemSpacingBelow: halfAnchor,
                                          multiplier: half.multiplier)
                .activeOrNot()
        }
    }
    
    return target.constraint(lessThanOrEqualTo: half.referenceAnchor,
                             constant: half.constant)
        .activeOrNot()
}

@discardableResult
public func <= (_ target: NSLayoutDimension,
         _ half: HalfNSLayoutConstraint<NSLayoutDimension>) -> NSLayoutConstraint {
    
    return target
        .constraint(lessThanOrEqualTo: half.referenceAnchor as! NSLayoutDimension,
                    multiplier: half.multiplier,
                    constant: half.constant)
        .activeOrNot()
}




// MARK: - Greater than or Equal

@discardableResult
public func >= <AnchorType> (_ target: NSLayoutAnchor<AnchorType>,
                      _ half: HalfNSLayoutConstraint<AnchorType>) -> NSLayoutConstraint {
    
    if #available(iOS 11.0, *), half.isSystemSpacingMultiplier {
        if let xAxisTarget = target as? NSLayoutXAxisAnchor,
            let halfAnchor = half.referenceAnchor as? NSLayoutXAxisAnchor {
            return xAxisTarget.constraint(greaterThanOrEqualToSystemSpacingAfter: halfAnchor,
                                          multiplier: half.multiplier)
                .activeOrNot()
        }else if let yAxisTarget = target as? NSLayoutYAxisAnchor,
            let halfAnchor = half.referenceAnchor as? NSLayoutYAxisAnchor {
            return yAxisTarget.constraint(greaterThanOrEqualToSystemSpacingBelow: halfAnchor,
                                          multiplier: half.multiplier)
                .activeOrNot()
        }
    }
    
    return target
        .constraint(greaterThanOrEqualTo: half.referenceAnchor,
                    constant: half.constant)
        .activeOrNot()
}


@discardableResult
public func >= (_ target: NSLayoutDimension,
         _ half: HalfNSLayoutConstraint<NSLayoutDimension>) -> NSLayoutConstraint {
    
    return target
        .constraint(greaterThanOrEqualTo: half.referenceAnchor as! NSLayoutDimension,
                    multiplier: half.multiplier,
                    constant: half.constant)
        .activeOrNot()
}


// MARK: set priority

extension NSLayoutConstraint {
    @discardableResult
    public func priority(value: Float) -> NSLayoutConstraint {
        self.priority = UILayoutPriority(rawValue: value)
        return self
    }
}
