# CoolLayout

[![CI Status](https://img.shields.io/travis/gearmamn06@gmail.com/CoolLayout.svg?style=flat)](https://travis-ci.org/gearmamn06@gmail.com/CoolLayout)
[![Version](https://img.shields.io/cocoapods/v/CoolLayout.svg?style=flat)](https://cocoapods.org/pods/CoolLayout)
[![License](https://img.shields.io/cocoapods/l/CoolLayout.svg?style=flat)](https://cocoapods.org/pods/CoolLayout)
[![Platform](https://img.shields.io/cocoapods/p/CoolLayout.svg?style=flat)](https://cocoapods.org/pods/CoolLayout)

CoolLayout eliminates boilerplate codes. Let's create and lay out views more concisely and explicitly. <br />

```swift
let circleView = UIView {
    $0.backgroundColor = UIColor.red
    $0.layer.borderColor = UIColor.black.cgColor
    $0.layer.borderWidth = 3
}

self.view.addSubview(circleView)

circleView.activate {
    $0.centerXAnchor == self.view.centerXAnchor + 0
    $0.centerYAnchor == self.view.centerYAnchor + 0
    $0.widthAnchor == 100
    $0.heightAnchor == 100
}

circleView.layoutIfNeeded()
circleView.apply {
    $0.layer.cornerRadius = $0.frame.width / 2
    $0.clipsToBounds = true
}
```

## Initializer
Create a view with a decoration closure.(In this case, the translatesAutoresizingMaskIntoConstraints flag of the view is assigned to false.)<br />
You can also reuse the decorating logic of the view.
```swift
enum Deco {
    
    enum Label {
        static let headLine: (UILabel) -> Void = {
            $0.textColor = UIColor.black
            $0.font = UIFont.boldSystemFont(ofSize: 30)
        }
        
        static let centerAlgin: (UILabel) -> Void = {
            $0.textAlignment = .center
        }
    }
    
    enum View {
        static let yellowWithDarkBorder: (UIView) -> Void = {
            $0.backgroundColor = UIColor.yellow
            $0.layer.borderColor = UIColor.black.cgColor
            $0.layer.borderWidth = 2
        }
    }
}
...
let label1 = UILabel.build {
    Deco.Label.headLine,
    Deco.Label.centerAlgin
}

let label2 = UILabel(autoLayout: [
    Deco.Label.headLine,
    Deco.Label.centerAlgin
])

self.view.addSubview(label)
self.view.addSubview(label2)

```
Also initialize the UIViewController using an initialization closure. This is very easy to inject dependencies.
```swift
let nextViewController = TableEmbedViewController {
    let items = (0..<10).map{ $0 }
    $0.viewModel = ViewModel(cellColor: UIColor.red, items: items)
}
```

## Apply
After creating the view, you can apply the decorating logic to the view in the same way.
```swift
let label = UILabel {
    $0.numberOfLines = 1
    $0.text = "row: \(value)"
}
.apply {
    Deco.Label.headLine
    Deco.Label.centerAlgin
}
// .apply([
//     Deco.Label.headLine,
//     Deco.Label.centerAlgin
// ])
.apply(Deco.View.yellowWithDarkBorder)
```

## NSLayoutConstraint
Apply and activate NSLayoutConstraint in a more readable way.
```swift
label.activate {
    $0.centerXAnchor == self.centerXAnchor + 0
    $0.leadingAnchor >= self.leadingAnchor + 20
    $0.trailingAnchor <= self.trailingAnchor + -20
    $0.topAnchor == self.topAnchor + 30
    $0.bottomAnchor == self.bottomAnchor + -30
}
```
You can also create an NSLayoutConstraint with a regular function expression.
```swift
self.label.apply {
    $0.text = "This method builds faster than using a custom operator."
}
.activate {
    $0.centerXAnchor.equal(self.view.centerXAnchor)
    $0.topAnchor.equal(self.circleView.bottomAnchor + 50)
    $0.leadingAnchor.greaterThan(orEqual: self.view.leadingAnchor + 20)
    $0.trailingAnchor.lessThan(orEqual: self.view.trailingAnchor + -20)
}
```

## Requirements
- iOS 9.0
- Swift 5.0

## Installation

### CocoaPods

```ruby
pod 'CoolLayout', '1.2.0'
```

### Carthage
```ogdl
github "gearmamn06/CoolLayout" "1.2.0"
```

### Swift Package Manager
```swift
dependencies: [
    .package(url: "https://github.com/gearmamn06/CoolLayout.git", from: "1.2.0")
]
```

## Contributor
wade.hawk, riley.kang 
