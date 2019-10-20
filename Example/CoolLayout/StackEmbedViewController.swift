//
//  SecondViewController.swift
//  CoolLayout_Example
//
//  Created by sudo.park on 19/10/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

import CoolLayout


class StackEmbedViewController: UIViewController {
    
    private let stackView = UIStackView {
        $0.alignment = .fill
        $0.distribution = .fillEqually
        $0.axis = .vertical
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(stackView)
        
        self.stackView.activate {
            $0.leadingAnchor == self.view.leadingAnchor + 0
            $0.trailingAnchor == self.view.trailingAnchor + 0
            $0.topAnchor == self.view.topAnchor + 0
            $0.bottomAnchor == self.view.bottomAnchor + 0
        }
        
        insertLabels()
    }
    
    
    private func insertLabels() {
        (0..<10).forEach { value in
            
            let label = UILabel {
                $0.numberOfLines = 1
                $0.text = "row: \(value)"
            }
            .apply([
                Deco.Label.headLine,
                Deco.Label.centerAlgin
            ])
            .apply(Deco.View.yellowWithDarkBorder)
            
            stackView.addArrangedSubview(label)
        }
    }
}
