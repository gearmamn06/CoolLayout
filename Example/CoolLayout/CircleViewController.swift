//
//  CircleViewController.swift
//  CoolLayout_Example
//
//  Created by Sudo.park on 2019/11/30.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

import CoolLayout


class CircleViewController: UIViewController {
    
    private let circleView = UIView {
        $0.backgroundColor = UIColor.blue
    }
    
    private let label = UILabel {
        $0.textColor = UIColor.black
        $0.textAlignment = .center
        $0.numberOfLines = 0
        $0.font = UIFont.boldSystemFont(ofSize: 18)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.apply {
            $0.backgroundColor = UIColor.white
            $0.addSubview(circleView)
            $0.addSubview(label)
        }
        
        self.circleView
            .activate {
                $0.centerXAnchor.equal(self.view.centerXAnchor)
                $0.centerYAnchor.equal(self.view.centerYAnchor)
                $0.widthAnchor.equal(100)
                $0.heightAnchor.equal(100)
            }
        self.circleView
            .apply {
                $0.layoutIfNeeded()
                $0.clipsToBounds = true
                $0.layer.cornerRadius = $0.frame.width / 2
            }
        
        self.label.apply {
                $0.text = "This method builds faster than using a custom operator."
            }
            .activate {
                $0.centerXAnchor.equal(self.view.centerXAnchor)
                $0.topAnchor.equal(self.circleView.bottomAnchor + 50)
                $0.leadingAnchor.greaterThan(orEqual: self.view.leadingAnchor + 20)
                $0.trailingAnchor.lessThan(orEqual: self.view.trailingAnchor + -20)
            }
    }
}
