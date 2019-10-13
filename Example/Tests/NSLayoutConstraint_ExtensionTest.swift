//
//  File.swift
//  CoolLayout_Example
//
//  Created by ParkHyunsoo on 2019/10/13.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import XCTest

import CoolLayout


class NSLayoutConstraint_ExtensionTest: XCTestCase {
    
    private var view: UIView!
    private var otherView: UIView!
    
    override func setUp() {
        
        view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        otherView = UIView()
        otherView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    func test_updateMultiplier() {
        
        // given
        let constraint = view.widthAnchor.constraint(equalTo: otherView.widthAnchor)
        
        // when
        let newConstraint = constraint.updateMultiply(0.7)
        
        // then
        let isEqualExceptMultiplier = newConstraint
            .equalExceptMultiplierAndConstatnt(view.widthAnchor.constraint(equalTo: otherView.widthAnchor, multiplier: 0.7))
        XCTAssert(isEqualExceptMultiplier)
        XCTAssertEqual(newConstraint.multiplier, 0.7, accuracy: 0.001)
    }
    
    func test_updateConstant() {
        
        // given
        let constraint = view.leadingAnchor.constraint(equalTo: otherView.leadingAnchor, constant: 20)
        
        // when
        let newConstraint = constraint.updateConstant(10)
        
        // then
        let isEqualExceptConstant = newConstraint
            .equalExceptMultiplierAndConstatnt(view.leadingAnchor.constraint(equalTo: otherView.leadingAnchor, constant: 10))
        XCTAssert(isEqualExceptConstant)
        XCTAssertEqual(newConstraint.constant, 10, accuracy: 0.001)
    }
}


fileprivate extension NSLayoutConstraint {
    
    func equalExceptMultiplierAndConstatnt(_ with: NSLayoutConstraint) -> Bool {
        guard let first = self.firstItem as? UIView,
            let firstOther = with.firstItem as? UIView,
            let second = self.secondItem as? UIView,
            let secondOther = with.secondItem as? UIView else {
            return false
        }
        
        if #available(iOS 10.0, *) {
            return first == firstOther
            && second == secondOther
            && self.firstAnchor == with.firstAnchor
            && self.secondAnchor == with.secondAnchor
            && self.firstAttribute == with.firstAttribute
            && self.relation == with.relation
            && self.secondAttribute == with.secondAttribute
        }
        
        return first == firstOther
            && second == secondOther
            && self.firstAttribute == with.firstAttribute
            && self.relation == with.relation
            && self.secondAttribute == with.secondAttribute
    }
}
