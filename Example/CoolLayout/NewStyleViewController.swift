//
//  SecondViewController.swift
//  CoolLayout_Example
//
//  Created by sudo.park on 19/10/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

import CoolLayout

fileprivate enum Label {
    static let headLine: (UILabel) -> Void = {
        $0.textColor = UIColor.black
        $0.font = UIFont.boldSystemFont(ofSize: 30)
    }
    
    static let centerAlgin: (UILabel) -> Void = {
        $0.textAlignment = .center
    }
}

fileprivate enum View {
    static let yellowWithDarkBorder: (UIView) -> Void = {
        $0.backgroundColor = UIColor.yellow
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.borderWidth = 2
    }
}


class NewStyleViewController: UIViewController {

    
    private let stackView: UIStackView = .cool {
        $0.alignment = .fill
        $0.distribution = .fillEqually
        $0.axis = .vertical
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(stackView)
        (stackView.leadingAnchor == self.view.leadingAnchor + 0).isActive = true
        (stackView.trailingAnchor == self.view.trailingAnchor + 0).isActive = true
        (stackView.topAnchor == self.view.topAnchor + 0).isActive = true
        (stackView.bottomAnchor == self.view.bottomAnchor + 0).isActive = true
        
        insertLabels()
    }
    
    
    private func insertLabels() {
        (0..<10).forEach { value in
            
            let label = UILabel.cool {
                $0.numberOfLines = 1
                $0.text = "row: \(value)"
            }
            label << Label.headLine + Label.centerAlgin + View.yellowWithDarkBorder
            stackView.addArrangedSubview(label)
        }
    }
}
