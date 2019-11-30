//
//  UIView_ExtensionTest.swift
//  CoolLayout_Example
//
//  Created by ParkHyunsoo on 2019/10/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import XCTest
import CoolLayout


class UIView_ExtensionTest: XCTestCase {
    
    var textColor: (UILabel) -> Void = {
        $0.textColor = .red
    }
    
    var font: (UILabel) -> Void = {
        $0.font = UIFont.systemFont(ofSize: 20)
    }
    
    var backgroundColor: (UIView) -> Void = {
        $0.backgroundColor = UIColor.green
    }
    
    var userInterfaceEnabled: (UIView) -> Void = {
        $0.isUserInteractionEnabled = false
    }
    
    override func setUp() {}
    
    override func tearDown() {}
}


// MARK: - test view initializer with closures

extension UIView_ExtensionTest {
    
    func test_viewCreation() {
        // given
        // when
        let view = UIView.autoLayout
        let label = UILabel.autoLayout
        let imageView = UIImageView.autoLayout
        // then
        XCTAssertNotNil(view)
        XCTAssertNotNil(label)
        XCTAssertTrue(label is UILabel)
        XCTAssertTrue(imageView is UIImageView)
    }
    
    func test_initViewWithSingleClosure() {
        // given
        // when
        let label = UILabel {
            $0.textColor = UIColor.red
            $0.backgroundColor = UIColor.green
        }
        
        // then
        XCTAssertEqual(label.textColor, UIColor.red)
        XCTAssertEqual(label.backgroundColor, UIColor.green)
    }
    
    func test_initViewwithMultiClosured() {
        // given
        // when
        let label = UILabel(autoLayout: self.textColor, self.font, self.backgroundColor)
        
        // then
        XCTAssertEqual(label.textColor, UIColor.red)
        XCTAssertEqual(label.backgroundColor, UIColor.green)
        XCTAssertEqual(label.font, UIFont.systemFont(ofSize: 20))
    }
    
    func test_initViewWithClosureArray() {
        // given
        let decorations = [
            self.textColor,
            self.font,
            self.backgroundColor
        ]
        
        // when
        let label = UILabel(autoLayout: decorations)
        
        // then
        XCTAssertEqual(label.textColor, UIColor.red)
        XCTAssertEqual(label.backgroundColor, UIColor.green)
        XCTAssertEqual(label.font, UIFont.systemFont(ofSize: 20))
    }
}


// MARK: - test apply decoration to view

extension UIView_ExtensionTest {
    
    
    func test_applyViewLevelSingleDecoration() {
        // given
        let view = UIView.autoLayout
        
        // when
        view.apply {
            $0.backgroundColor = UIColor.red
        }
        
        // then
        XCTAssertEqual(view.backgroundColor, UIColor.red)
    }
    
    func test_applyViewLevelDecoration() {
        // given
        let label = UILabel.autoLayout
        
        // when
        label.apply(backgroundColor)
        
        // then
        XCTAssertEqual(label.backgroundColor, UIColor.green)
    }
    
    func test_applyViewLevelMultipleDecorations() {
        // given
        let view = UIView.autoLayout
        
        // when
        view.apply(backgroundColor, userInterfaceEnabled)
        
        // then
        XCTAssertEqual(view.backgroundColor, UIColor.green)
        XCTAssertEqual(view.isUserInteractionEnabled, false)
    }
    
    func test_applyViewLevelDecorationUsingArray() {
        // given
        let view = UIView.autoLayout
        let decorations = [
            backgroundColor, userInterfaceEnabled
        ]
        
        // when
        view.apply(decorations)
        
        // then
        XCTAssertEqual(view.backgroundColor, UIColor.green)
        XCTAssertEqual(view.isUserInteractionEnabled, false)
    }
    
    func test_applySelfLevelSingleDecoration() {
        // given
        let label = UILabel.autoLayout
        
        // when
        label.apply {
            $0.textColor = UIColor.red
        }
        
        // then
        XCTAssertEqual(label.textColor, UIColor.red)
    }
    
    func test_applySelfLevelMultipleDecorations() {
        // given
        let label = UILabel.autoLayout
        
        // when
        label.apply(textColor, font)
        
        // then
        XCTAssertEqual(label.textColor, UIColor.red)
        XCTAssertEqual(label.font, UIFont.systemFont(ofSize: 20))
    }
    
    
    func test_applySelfLevelDecorationUsingArray() {
        // given
        let label = UILabel.autoLayout
        let decorations = [textColor, font]
        
        // when
        label.apply(decorations)
        
        // then
        XCTAssertEqual(label.textColor, UIColor.red)
        XCTAssertEqual(label.font, UIFont.systemFont(ofSize: 20))
    }
    
    func test_applyDecorationLevelCombine() {
        // given
        let label = UILabel.autoLayout
        
        // when
        label.apply {
            $0.textColor = UIColor.red
        }
        .apply {
            $0.backgroundColor = UIColor.black
        }
        
        
        // then
        XCTAssertEqual(label.textColor, UIColor.red)
        XCTAssertEqual(label.backgroundColor, UIColor.black)
    }
}


// MARK: - Test active constraints

extension UIView_ExtensionTest {
    
    func test_activeBatchConstraints() {
        // given
        let container = UIView(frame: CGRect(origin: .zero,
                                             size: CGSize(width: 100, height: 100)))
        let view = UIView.autoLayout
        container.addSubview(view)
        
        var top: NSLayoutConstraint!
        var bottom: NSLayoutConstraint!
        var leading: NSLayoutConstraint!
        var trailing: NSLayoutConstraint!
        
        // when
        
        view.activate {
            leading = $0.leadingAnchor == container.leadingAnchor + 10
            trailing = $0.trailingAnchor == container.trailingAnchor + -10
            top = $0.topAnchor == container.topAnchor + 10
            bottom = $0.bottomAnchor == container.bottomAnchor + -10
        }
        
        // then
        XCTAssertTrue(top.isActive)
        XCTAssertTrue(bottom.isActive)
        XCTAssertTrue(leading.isActive)
        XCTAssertTrue(trailing.isActive)
    }
}
