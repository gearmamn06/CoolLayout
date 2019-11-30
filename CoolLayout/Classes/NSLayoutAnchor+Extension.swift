//
//  NSLayoutAnchor+Extension.swift
//  CoolLayout
//
//  Created by Sudo.park on 2019/11/30.
//

import UIKit


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


// MARK: - Equal operation
extension NSLayoutXAxisAnchor {
    
    @discardableResult
    public func equal(_ otherAnchor: NSLayoutXAxisAnchor) -> NSLayoutConstraint {
        return self.constraint(equalTo: otherAnchor)
            .activeOrNot()
    }
    
    @discardableResult
    public func equal(_ half: HalfNSLayoutConstraint<NSLayoutXAxisAnchor>) -> NSLayoutConstraint {
        return self.constraint(equalTo: half.referenceAnchor, constant: half.constant)
            .activeOrNot()
    }
}

extension NSLayoutYAxisAnchor {
    
    @discardableResult
    public func equal(_ otherAnchor: NSLayoutYAxisAnchor) -> NSLayoutConstraint {
        return self.constraint(equalTo: otherAnchor)
            .activeOrNot()
    }
    
    @discardableResult
    public func equal(_ half: HalfNSLayoutConstraint<NSLayoutYAxisAnchor>) -> NSLayoutConstraint {
        return self.constraint(equalTo: half.referenceAnchor, constant: half.constant)
            .activeOrNot()
    }
}

extension NSLayoutDimension {
    
    @discardableResult
    public func equal(_ constant: CGFloat) -> NSLayoutConstraint {
        return self.constraint(equalToConstant: constant)
        .activeOrNot()
    }
    
    @discardableResult
    public func equal(_ otherAnchor: NSLayoutDimension) -> NSLayoutConstraint {
        return self.constraint(equalTo: otherAnchor)
            .activeOrNot()
    }
    
    @discardableResult
    public func equal(_ half: HalfNSLayoutConstraint<NSLayoutDimension>) -> NSLayoutConstraint {
        guard let layoutDimension = half.referenceAnchor as? NSLayoutDimension else {
            fatalError()
        }
        return self.constraint(equalTo: layoutDimension, multiplier: half.multiplier, constant: half.constant)
            .activeOrNot()
    }
}

// MARK: - greaterThan operation
extension NSLayoutXAxisAnchor {
    
    @discardableResult
    public func greaterThan(orEqual otherAnchor: NSLayoutXAxisAnchor) -> NSLayoutConstraint {
        return self.constraint(greaterThanOrEqualTo: otherAnchor)
            .activeOrNot()
    }
    
    @discardableResult
    public func greaterThan(orEqual half: HalfNSLayoutConstraint<NSLayoutXAxisAnchor>) -> NSLayoutConstraint {
        return self.constraint(greaterThanOrEqualTo: half.referenceAnchor, constant: half.constant)
            .activeOrNot()
    }
}

extension NSLayoutYAxisAnchor {
    
    @discardableResult
    public func greaterThan(orEqual otherAnchor: NSLayoutYAxisAnchor) -> NSLayoutConstraint {
        return self.constraint(greaterThanOrEqualTo: otherAnchor)
            .activeOrNot()
    }
    
    @discardableResult
    public func greaterThan(orEqual half: HalfNSLayoutConstraint<NSLayoutYAxisAnchor>) -> NSLayoutConstraint {
        return self.constraint(greaterThanOrEqualTo: half.referenceAnchor, constant: half.constant)
            .activeOrNot()
    }
}

extension NSLayoutDimension {
    
    @discardableResult
    public func greaterThan(orEqual constant: CGFloat) -> NSLayoutConstraint {
        return self.constraint(greaterThanOrEqualToConstant: constant)
        .activeOrNot()
    }
    
    @discardableResult
    public func greaterThan(orEqual otherAnchor: NSLayoutDimension) -> NSLayoutConstraint {
        return self.constraint(greaterThanOrEqualTo: otherAnchor)
            .activeOrNot()
    }
    
    @discardableResult
    public func greaterThan(orEqual half: HalfNSLayoutConstraint<NSLayoutDimension>) -> NSLayoutConstraint {
        guard let layoutDimension = half.referenceAnchor as? NSLayoutDimension else {
            fatalError()
        }
        return self.constraint(greaterThanOrEqualTo: layoutDimension,
                               multiplier: half.multiplier, constant: half.constant)
            .activeOrNot()
    }
}

// MARK: - lessThan operation
extension NSLayoutXAxisAnchor {
    
    @discardableResult
    public func lessThan(orEqual otherAnchor: NSLayoutXAxisAnchor) -> NSLayoutConstraint {
        return self.constraint(lessThanOrEqualTo: otherAnchor)
            .activeOrNot()
    }
    
    @discardableResult
    public func lessThan(orEqual half: HalfNSLayoutConstraint<NSLayoutXAxisAnchor>) -> NSLayoutConstraint {
        return self.constraint(lessThanOrEqualTo: half.referenceAnchor, constant: half.constant)
            .activeOrNot()
    }
}

extension NSLayoutYAxisAnchor {
    
    @discardableResult
    public func lessThan(orEqual otherAnchor: NSLayoutYAxisAnchor) -> NSLayoutConstraint {
        return self.constraint(lessThanOrEqualTo: otherAnchor)
            .activeOrNot()
    }
    
    @discardableResult
    public func lessThan(orEqual half: HalfNSLayoutConstraint<NSLayoutYAxisAnchor>) -> NSLayoutConstraint {
        return self.constraint(lessThanOrEqualTo: half.referenceAnchor, constant: half.constant)
            .activeOrNot()
    }
}

extension NSLayoutDimension {
    
    @discardableResult
    public func lessThan(orEqual constant: CGFloat) -> NSLayoutConstraint {
        return self.constraint(lessThanOrEqualToConstant: constant)
        .activeOrNot()
    }
    
    @discardableResult
    public func lessThan(orEqual otherAnchor: NSLayoutDimension) -> NSLayoutConstraint {
        return self.constraint(lessThanOrEqualTo: otherAnchor)
            .activeOrNot()
    }
    
    @discardableResult
    public func lessThan(orEqual half: HalfNSLayoutConstraint<NSLayoutDimension>) -> NSLayoutConstraint {
        guard let layoutDimension = half.referenceAnchor as? NSLayoutDimension else {
            fatalError()
        }
        return self.constraint(lessThanOrEqualTo: layoutDimension,
                               multiplier: half.multiplier, constant: half.constant)
            .activeOrNot()
    }
}
