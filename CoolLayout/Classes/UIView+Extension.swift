//
//  UIView+Extension.swift
//  CoolLayout
//
//  Created by sudo.park on 19/10/2019.
//

import UIKit

// MARK: extension for < swift 5.1

extension NSCoding where Self: UIView {

    public static var autoLayout: Self {
        let view = self.init()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    public init(autoLayout: (Self) -> Void) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        autoLayout(self)
    }
    
    public init(autoLayout: ((Self) -> Void)...) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        autoLayout.forEach {
            $0(self)
        }
    }
    
    public init(autoLayout: [((Self) -> Void)]) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        autoLayout.forEach {
            $0(self)
        }
    }
}


// MARK: - apply decorations

extension NSCoding where Self: UIView {
    
    @discardableResult
    public func apply(_ decorating: (Self) -> Void) -> Self {
        decorating(self)
        return self
    }
    
    @discardableResult
    public func apply(_ decoratings: ((Self) -> Void)...) -> Self {
        decoratings.forEach {
            $0(self)
        }
        return self
    }

    @discardableResult
    public func apply(_ decoratings: [(Self) -> Void]) -> Self {
        decoratings.forEach {
            $0(self)
        }
        return self
    }
    
    @discardableResult
    public func apply(_ decorating: (UIView) -> Void) -> Self {
        decorating(self)
        return self
    }
    
    @discardableResult
    public func apply(_ decoratings: ((UIView) -> Void)...) -> Self {
        decoratings.forEach {
            $0(self)
        }
        return self
    }

    @discardableResult
    public func apply(_ decoratings: [(UIView) -> Void]) -> Self {
        decoratings.forEach {
            $0(self)
        }
        return self
    }
}

// MARK: using DecoratingBuilder

private func + <V: UIView>(lhs: @escaping (V) -> Void, rhs: @escaping (V) -> Void) -> (V) -> Void {
    return { view in
        lhs(view)
        rhs(view)
    }
}


@_functionBuilder
public struct DecoratingBuilder<V: UIView> {

    // build time: 24ms
    public static func buildBlock(_ decoratings: ((V) -> Void)...) -> (V) -> Void {
        let empty: (V) -> Void = { _ in }
        return decoratings.reduce(empty, { (acc: @escaping (V) -> Void, decoration: @escaping (V) -> Void ) -> (V) -> Void in
            return acc + decoration
        })
    }
}

extension NSCoding where Self: UIView {

    public static func build(@DecoratingBuilder<Self> _ builder: () -> (Self) -> Void) -> Self {
        let decorating = builder()
        let view = Self.init()
        view.translatesAutoresizingMaskIntoConstraints = false
        decorating(view)
        return view
    }

    public func apply(@DecoratingBuilder<Self> _ builder: () -> (Self) -> Void) {
        let decorating = builder()
        decorating(self)
    }
}


// MARK: - extension for active constraints

extension UIView {
    
    fileprivate struct FlagHolder {
        static var flagMap: [Int: Bool] = [:]
    }
    
    var shouldActiveWhenConstraintMade: Bool {
        let key = self.hash
        return FlagHolder.flagMap[key] ?? false
    }
    
    
    public func activate(_ buildConstraint: (UIView) -> Void) {
        let key = self.hash
        FlagHolder.flagMap[key] = true
        buildConstraint(self)
        FlagHolder.flagMap[key] = false
    }
}
