import XCTest
import CoolLayout

class NSLayoutConstraintFormulaTest: XCTestCase {
    
    private var view: UIView!
    private var referenceView: UIView!
    
    override func setUp() {
        
        view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        referenceView = UIView()
        referenceView.translatesAutoresizingMaskIntoConstraints = false
    }
}


// MARK: Test equal

extension NSLayoutConstraintFormulaTest {
    
    func test_xAnchorEqualWithConstraint() {
        // given
        // when
        let constraintLeading = view.leadingAnchor == referenceView.leadingAnchor + 20
        let constraintTrailing = view.trailingAnchor == referenceView.trailingAnchor + -20
        let constraintCenterX = view.centerXAnchor == referenceView.centerXAnchor + 20
        
        // Then
        let isEqualLeading = (view.leadingAnchor.constraint(equalTo: referenceView.leadingAnchor, constant: 20))
            .equal(with: constraintLeading)
        let isEqualTrailing = (view.trailingAnchor.constraint(equalTo: referenceView.trailingAnchor, constant: -20))
            .equal(with: constraintTrailing)
        let isEqualcenter = (view.centerXAnchor.constraint(equalTo: referenceView.centerXAnchor, constant: 20))
            .equal(with: constraintCenterX)
        
        XCTAssert(isEqualLeading)
        XCTAssert(isEqualTrailing)
        XCTAssert(isEqualcenter)
    }
    
    
    func test_yAnchorEqualWithConstraint() {
        // given
        // when
        let constraintTop = view.topAnchor == referenceView.topAnchor + 20
        let constraintBottom = view.bottomAnchor == referenceView.bottomAnchor + -20
        let constraintCenterY = view.centerYAnchor == referenceView.centerYAnchor + 20
        
        // then
        let isEqualTop = (view.topAnchor.constraint(equalTo: referenceView.topAnchor, constant: 20))
            .equal(with: constraintTop)
        let isEqualBottom = (view.bottomAnchor.constraint(equalTo: referenceView.bottomAnchor, constant: -20))
            .equal(with: constraintBottom)
        let isEqualCenterY = (view.centerYAnchor.constraint(equalTo: referenceView.centerYAnchor, constant: 20))
            .equal(with: constraintCenterY)
        
        XCTAssert(isEqualTop)
        XCTAssert(isEqualBottom)
        XCTAssert(isEqualCenterY)
    }
    
    @available(iOS 11.0, *)
    func test_anchorEqualWithSystemSpacing() {
        // given
        // when
        let constraintLeading = view.leadingAnchor == referenceView.leadingAnchor * 0.5
        let constraintTrailing = view.trailingAnchor == referenceView.trailingAnchor * 0.5
        let constraintTop = view.topAnchor == referenceView.topAnchor * 0.5
        let constraintBottom = view.bottomAnchor == referenceView.bottomAnchor * 0.5
        let constraintCenterX = view.centerXAnchor == referenceView.centerXAnchor * 0.5
        let constraintCenterY = view.centerYAnchor == referenceView.centerYAnchor * 0.5
        
        // then
        let isEqualLeading = (view.leadingAnchor.constraint(equalToSystemSpacingAfter: referenceView.leadingAnchor, multiplier: 0.5))
            .equal(with: constraintLeading)
        let isEqualTrailing = (view.trailingAnchor.constraint(equalToSystemSpacingAfter: referenceView.trailingAnchor, multiplier: 0.5))
            .equal(with: constraintTrailing)
        let isEqualTop = (view.topAnchor.constraint(equalToSystemSpacingBelow: referenceView.topAnchor, multiplier: 0.5))
            .equal(with: constraintTop)
        let isEqualBottom = (view.bottomAnchor.constraint(equalToSystemSpacingBelow: referenceView.bottomAnchor, multiplier: 0.5))
            .equal(with: constraintBottom)
        let isEqaulCenterX = (view.centerXAnchor.constraint(equalToSystemSpacingAfter: referenceView.centerXAnchor, multiplier: 0.5))
            .equal(with: constraintCenterX)
        let isEqaulCenterY = (view.centerYAnchor.constraint(equalToSystemSpacingBelow: referenceView.centerYAnchor, multiplier: 0.5))
            .equal(with: constraintCenterY)
        
        XCTAssert(isEqualLeading)
        XCTAssert(isEqualTrailing)
        XCTAssert(isEqualTop)
        XCTAssert(isEqualBottom)
        XCTAssert(isEqaulCenterX)
        XCTAssert(isEqaulCenterY)
    }
    
    
    func test_dimensionEqualWithConstant() {
        // given
        // when
        let constarintWidth = view.widthAnchor == referenceView.widthAnchor + 20
        let constraintHeight = view.heightAnchor == referenceView.heightAnchor + 20
        
        // then
        let isEqualWidth = (view.widthAnchor.constraint(equalTo: referenceView.widthAnchor, constant: 20))
            .equal(with: constarintWidth)
        let isEqualHeight = (view.heightAnchor.constraint(equalTo: referenceView.heightAnchor, constant: 20))
            .equal(with: constraintHeight)
        
        XCTAssert(isEqualWidth)
        XCTAssert(isEqualHeight)
    }
    
    
    func test_dimensionEqualWithMultiplier() {
        // given
        // when
        let constraintWidth = view.widthAnchor == referenceView.widthAnchor * 0.8
        let constraintHeight = view.heightAnchor == referenceView.heightAnchor * 0.8
        
        // then
        let isEqualWith = (view.widthAnchor.constraint(equalTo: referenceView.widthAnchor, multiplier: 0.8))
            .equal(with: constraintWidth)
        let isEqualHeight = (view.heightAnchor.constraint(equalTo: referenceView.heightAnchor, multiplier: 0.8))
            .equal(with: constraintHeight)
        
        XCTAssert(isEqualWith)
        XCTAssert(isEqualHeight)
    }
    
    
    func test_dimensionEqualWithConstantAndMutiplier() {
        // given
        // when
        let constraintWidth = view.widthAnchor == referenceView.widthAnchor * 0.8 + 20
        let constraintHeight = view.heightAnchor == referenceView.heightAnchor * 0.8 + 20
        
        // then
        let isEqualWidth = (view.widthAnchor.constraint(equalTo: referenceView.widthAnchor, multiplier: 0.8, constant: 20))
            .equal(with: constraintWidth)
        let isEqualHeight = (view.heightAnchor.constraint(equalTo: referenceView.heightAnchor, multiplier: 0.8, constant: 20))
            .equal(with: constraintHeight)
        
        XCTAssert(isEqualWidth)
        XCTAssert(isEqualHeight)
    }
}



// MARK: Test dimension equal constant value

extension NSLayoutConstraintFormulaTest {
    
    func test_dimensionEqualConstantValue() {
        // given
        // when
        let constraintWidth = view.widthAnchor == 200
        let constraintHeight = view.heightAnchor == 200
        
        // then
        let isEqualWidth = (view.widthAnchor.constraint(equalToConstant: 200))
            .equal(with: constraintWidth)
        let isEqualHeight = (view.heightAnchor.constraint(equalToConstant: 200))
            .equal(with: constraintHeight)
        
        XCTAssert(isEqualWidth)
        XCTAssert(isEqualHeight)
    }
}


// MARK: Test Less than or Equal

extension NSLayoutConstraintFormulaTest {
    
    func test_xAnchorLTEWithConstant() {
        // given
        // when
        let constraintLeading = view.leadingAnchor <= referenceView.leadingAnchor + 20
        let constraintTrailing = view.trailingAnchor <= referenceView.trailingAnchor + -20
        let constraintCenterX = view.centerXAnchor <= referenceView.centerXAnchor + 20
        
        // then
        let isEqualLeading = (view.leadingAnchor.constraint(lessThanOrEqualTo: referenceView.leadingAnchor, constant: 20))
            .equal(with: constraintLeading)
        let isEqualTrailing = (view.trailingAnchor.constraint(lessThanOrEqualTo: referenceView.trailingAnchor, constant: -20))
            .equal(with: constraintTrailing)
        let isEqaulCenterX = (view.centerXAnchor.constraint(lessThanOrEqualTo: referenceView.centerXAnchor, constant: 20))
            .equal(with: constraintCenterX)
        
        XCTAssert(isEqualLeading)
        XCTAssert(isEqualTrailing)
        XCTAssert(isEqaulCenterX)
    }
    
    func test_yAnchorLTEWithConstant() {
        // given
        // when
        let constraintTop = view.topAnchor <= referenceView.topAnchor + 20
        let constraintBottom = view.bottomAnchor <= referenceView.bottomAnchor + -20
        let constraintCenterY = view.centerYAnchor <= referenceView.centerYAnchor + 20
        
        // then
        let isEqualTop = (view.topAnchor.constraint(lessThanOrEqualTo: referenceView.topAnchor, constant: 20))
            .equal(with: constraintTop)
        let isEqualBottom = (view.bottomAnchor.constraint(lessThanOrEqualTo: referenceView.bottomAnchor, constant: -20))
            .equal(with: constraintBottom)
        let isEqualCenterY = (view.centerYAnchor.constraint(lessThanOrEqualTo: referenceView.centerYAnchor, constant: 20))
            .equal(with: constraintCenterY)
        
        XCTAssert(isEqualTop)
        XCTAssert(isEqualBottom)
        XCTAssert(isEqualCenterY)
    }
    
    
    @available(iOS 11.0, *)
    func test_anchorLTEWithSystemSpacing() {
        // given
        // when
        let constraintLeading = view.leadingAnchor <= referenceView.leadingAnchor * 0.5
        let constraintTrailing = view.trailingAnchor <= referenceView.trailingAnchor * 0.5
        let constraintTop = view.topAnchor <= referenceView.topAnchor * 0.5
        let constraintBottom = view.bottomAnchor <= referenceView.bottomAnchor * 0.5
        let constraintCenterX = view.centerXAnchor <= referenceView.centerXAnchor * 0.5
        let constraintCenterY = view.centerYAnchor <= referenceView.centerYAnchor * 0.5
        
        // then
        let isEqualLeading = (view.leadingAnchor.constraint(lessThanOrEqualToSystemSpacingAfter: referenceView.leadingAnchor, multiplier: 0.5))
            .equal(with: constraintLeading)
        let isEqualTrailing = (view.trailingAnchor.constraint(lessThanOrEqualToSystemSpacingAfter: referenceView.trailingAnchor, multiplier: 0.5))
            .equal(with: constraintTrailing)
        let isEqualTop = (view.topAnchor.constraint(lessThanOrEqualToSystemSpacingBelow: referenceView.topAnchor, multiplier: 0.5))
            .equal(with: constraintTop)
        let isEqualBottom = (view.bottomAnchor.constraint(lessThanOrEqualToSystemSpacingBelow: referenceView.bottomAnchor, multiplier: 0.5))
            .equal(with: constraintBottom)
        let isEqaulCenterX = (view.centerXAnchor.constraint(lessThanOrEqualToSystemSpacingAfter: referenceView.centerXAnchor, multiplier: 0.5))
            .equal(with: constraintCenterX)
        let isEqaulCenterY = (view.centerYAnchor.constraint(lessThanOrEqualToSystemSpacingBelow: referenceView.centerYAnchor, multiplier: 0.5))
            .equal(with: constraintCenterY)
        
        XCTAssert(isEqualLeading)
        XCTAssert(isEqualTrailing)
        XCTAssert(isEqualTop)
        XCTAssert(isEqualBottom)
        XCTAssert(isEqaulCenterX)
        XCTAssert(isEqaulCenterY)
    }
    
    
    func test_dimentionLTEWithConstant() {
        // given
        // when
        let constraintWidth = view.widthAnchor <= referenceView.widthAnchor + -20
        let constraintHeight = view.heightAnchor <= referenceView.heightAnchor + -20
        
        // then
        let isEqualWidth = (view.widthAnchor.constraint(lessThanOrEqualTo: referenceView.widthAnchor, constant: -20))
            .equal(with: constraintWidth)
        let isEqualHeight = (view.heightAnchor.constraint(lessThanOrEqualTo: referenceView.heightAnchor, constant: -20))
            .equal(with: constraintHeight)
        
        XCTAssert(isEqualWidth)
        XCTAssert(isEqualHeight)
    }

    func test_dimentionLTEWithMutiplier() {
        // given
        // when
        let constraintWidth = view.widthAnchor <= referenceView.widthAnchor * 0.8
        let constraintHeight = view.heightAnchor <= referenceView.heightAnchor * 0.8
        
        // then
        let isEqualWidth = (view.widthAnchor.constraint(lessThanOrEqualTo: referenceView.widthAnchor, multiplier: 0.8))
            .equal(with: constraintWidth)
        let isEqualHeight = (view.heightAnchor.constraint(lessThanOrEqualTo: referenceView.heightAnchor, multiplier: 0.8))
            .equal(with: constraintHeight)
        
        XCTAssert(isEqualWidth)
        XCTAssert(isEqualHeight)
    }

    func test_dimensionLTEWithConstantAndMutiplier() {
        // given
        // when
        let constraintWidth = view.widthAnchor <= referenceView.widthAnchor * 0.8 + 20
        let constraintHeight = view.heightAnchor <= referenceView.heightAnchor * 0.8 + 20
        
        // then
        let isEqualWidth = (view.widthAnchor.constraint(lessThanOrEqualTo: referenceView.widthAnchor, multiplier: 0.8, constant: 20))
            .equal(with: constraintWidth)
        let isEqualHeight = (view.heightAnchor.constraint(lessThanOrEqualTo: referenceView.heightAnchor, multiplier: 0.8, constant: 20))
            .equal(with: constraintHeight)
        
        XCTAssert(isEqualWidth)
        XCTAssert(isEqualHeight)
    }
}



// MARK: Greater than or Equal

extension NSLayoutConstraintFormulaTest {
        
    func test_xAnchorGTEWithConstant() {
        // given
        // when
        let constrantLeading = view.leadingAnchor >= referenceView.leadingAnchor + 20
        let constraintTrailing = view.trailingAnchor >= referenceView.trailingAnchor + -20
        let constraintCenterX = view.centerXAnchor >= referenceView.centerXAnchor + 20
        
        // then
        let isEqualLeaing = (view.leadingAnchor.constraint(greaterThanOrEqualTo: referenceView.leadingAnchor, constant: 20))
            .equal(with: constrantLeading)
        let isEqualTrailing = (view.trailingAnchor.constraint(greaterThanOrEqualTo: referenceView.trailingAnchor, constant: -20))
            .equal(with: constraintTrailing)
        let isEqualCenterX = (view.centerXAnchor.constraint(greaterThanOrEqualTo: referenceView.centerXAnchor, constant: 20))
            .equal(with: constraintCenterX)
        
        XCTAssert(isEqualLeaing)
        XCTAssert(isEqualTrailing)
        XCTAssert(isEqualCenterX)
    }

    func test_yAnchorGTEWithConstant() {
        // given
        // when
        let constraintTop = view.topAnchor >= referenceView.topAnchor + 20
        let constraintBottom = view.bottomAnchor >= referenceView.bottomAnchor + -20
        let constraintCenterY = view.centerYAnchor >= referenceView.centerYAnchor + 20
        
        // then
        let isEqualTop = (view.topAnchor.constraint(greaterThanOrEqualTo: referenceView.topAnchor, constant: 20))
            .equal(with: constraintTop)
        let isEqualBottom = (view.bottomAnchor.constraint(greaterThanOrEqualTo: referenceView.bottomAnchor, constant: -20))
            .equal(with: constraintBottom)
        let isEqualCenterY = (view.centerYAnchor.constraint(greaterThanOrEqualTo: referenceView.centerYAnchor, constant: 20))
            .equal(with: constraintCenterY)
        
        XCTAssert(isEqualTop)
        XCTAssert(isEqualBottom)
        XCTAssert(isEqualCenterY)
    }
    
    
    @available(iOS 11.0, *)
    func test_anchorGTEWithSystemSpacing() {
        // given
        // when
        let constraintLeading = view.leadingAnchor >= referenceView.leadingAnchor * 0.5
        let constraintTrailing = view.trailingAnchor >= referenceView.trailingAnchor * 0.5
        let constraintTop = view.topAnchor >= referenceView.topAnchor * 0.5
        let constraintBottom = view.bottomAnchor >= referenceView.bottomAnchor * 0.5
        let constraintCenterX = view.centerXAnchor >= referenceView.centerXAnchor * 0.5
        let constraintCenterY = view.centerYAnchor >= referenceView.centerYAnchor * 0.5
        
        // then
        let isEqualLeading = (view.leadingAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: referenceView.leadingAnchor, multiplier: 0.5))
            .equal(with: constraintLeading)
        let isEqualTrailing = (view.trailingAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: referenceView.trailingAnchor, multiplier: 0.5))
            .equal(with: constraintTrailing)
        let isEqualTop = (view.topAnchor.constraint(greaterThanOrEqualToSystemSpacingBelow: referenceView.topAnchor, multiplier: 0.5))
            .equal(with: constraintTop)
        let isEqualBottom = (view.bottomAnchor.constraint(greaterThanOrEqualToSystemSpacingBelow: referenceView.bottomAnchor, multiplier: 0.5))
            .equal(with: constraintBottom)
        let isEqaulCenterX = (view.centerXAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: referenceView.centerXAnchor, multiplier: 0.5))
            .equal(with: constraintCenterX)
        let isEqaulCenterY = (view.centerYAnchor.constraint(greaterThanOrEqualToSystemSpacingBelow: referenceView.centerYAnchor, multiplier: 0.5))
            .equal(with: constraintCenterY)
        
        XCTAssert(isEqualLeading)
        XCTAssert(isEqualTrailing)
        XCTAssert(isEqualTop)
        XCTAssert(isEqualBottom)
        XCTAssert(isEqaulCenterX)
        XCTAssert(isEqaulCenterY)
    }

    func test_dimentionGTEWithConstant() {
        // given
        // when
        let constraintWidth = view.widthAnchor >= referenceView.widthAnchor + -20
        let constraintHeight = view.heightAnchor >= referenceView.heightAnchor + -20
        
        // then
        let isEqualWidth = (view.widthAnchor.constraint(greaterThanOrEqualTo: referenceView.widthAnchor, constant: -20))
            .equal(with: constraintWidth)
        let isEqualHeight = (view.heightAnchor.constraint(greaterThanOrEqualTo: referenceView.heightAnchor, constant: -20))
            .equal(with: constraintHeight)
        
        XCTAssert(isEqualWidth)
        XCTAssert(isEqualHeight)
    }

    func test_dimentionGTEWithMutiplier() {
        // given
        // when
        let constraintWidth = view.widthAnchor >= referenceView.widthAnchor * 0.8
        let constraintHeight = view.heightAnchor >= referenceView.heightAnchor * 0.8
        
        // then
        let isEqualWidth = (view.widthAnchor.constraint(greaterThanOrEqualTo: referenceView.widthAnchor, multiplier: 0.8))
            .equal(with: constraintWidth)
        let isEqualHeight = (view.heightAnchor.constraint(greaterThanOrEqualTo: referenceView.heightAnchor, multiplier: 0.8))
            .equal(with: constraintHeight)
        
        XCTAssert(isEqualWidth)
        XCTAssert(isEqualHeight)
    }

    func test_dimensionGTEWithConstantAndMutiplier() {
        // given
        // when
        let constraintWidth = view.widthAnchor >= referenceView.widthAnchor * 0.8 + 20
        let constraintHeight = view.heightAnchor >= referenceView.heightAnchor * 0.8 + 20
        
        // then
        let isEqualWidth = (view.widthAnchor.constraint(greaterThanOrEqualTo: referenceView.widthAnchor, multiplier: 0.8, constant: 20))
            .equal(with: constraintWidth)
        let isEqualHeight = (view.heightAnchor.constraint(greaterThanOrEqualTo: referenceView.heightAnchor, multiplier: 0.8, constant: 20))
            .equal(with: constraintHeight)
        
        XCTAssert(isEqualWidth)
        XCTAssert(isEqualHeight)
    }
}


fileprivate extension NSLayoutConstraint {
    
    func equal(with: NSLayoutConstraint) -> Bool {
        guard let first = self.firstItem as? UIView,
            let firstOther = with.firstItem as? UIView,
            let second = self.secondItem as? UIView,
            let secondOther = with.secondItem as? UIView else {
                return firstAttribute == with.firstAttribute
                    && relation == with.relation
                    && secondAttribute == with.secondAttribute
                    && multiplier == with.multiplier
                    && constant == with.constant
        }
        
        if #available(iOS 10.0, *) {
            return first == firstOther
            && second == secondOther
            && self.firstAnchor == with.firstAnchor
            && self.secondAnchor == with.secondAnchor
            && self.firstAttribute == with.firstAttribute
            && self.relation == with.relation
            && self.secondAttribute == with.secondAttribute
            && self.multiplier == with.multiplier
            && self.constant == with.constant
        }
        
        return first == firstOther
            && second == secondOther
            && self.firstAttribute == with.firstAttribute
            && self.relation == with.relation
            && self.secondAttribute == with.secondAttribute
            && self.multiplier == with.multiplier
            && self.constant == with.constant
    }
}
