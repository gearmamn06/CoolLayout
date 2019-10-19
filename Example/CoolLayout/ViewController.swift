//
//  ViewController.swift
//  CoolLayout
//
//  Created by gearmamn06@gmail.com on 10/13/2019.
//  Copyright (c) 2019 gearmamn06@gmail.com. All rights reserved.
//

import UIKit

import CoolLayout

class ViewController: UIViewController {
    
    let darkLabel: (UILabel) -> Void = {
        $0.textColor = UIColor.black
        $0.font = UIFont.systemFont(ofSize: 20)
    }
    
    let centerAlgin: (UILabel) -> Void = {
        $0.textAlignment = .center
    }
    
    var yellowBackground: (UIView) -> Void = {
        $0.backgroundColor = UIColor.yellow
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let stackView = UIStackView.cool {
            $0.alignment = .fill
            $0.distribution = .fillEqually
            $0.axis = .vertical
        }
        self.view.addSubview(stackView)
        if #available(iOS 11.0, *) {
            (stackView.leadingAnchor == self.view.safeAreaLayoutGuide.leadingAnchor + 0).isActive = true
            (stackView.trailingAnchor == self.view.safeAreaLayoutGuide.trailingAnchor + 0).isActive = true
            (stackView.topAnchor == self.view.safeAreaLayoutGuide.topAnchor + 0).isActive = true
            (stackView.bottomAnchor == self.view.safeAreaLayoutGuide.bottomAnchor + 0).isActive = true
        } else {
            (stackView.leadingAnchor == self.view.leadingAnchor + 0).isActive = true
            (stackView.trailingAnchor == self.view.trailingAnchor + 0).isActive = true
            (stackView.topAnchor == self.view.topAnchor + 0).isActive = true
            (stackView.bottomAnchor == self.view.bottomAnchor + 0).isActive = true
        }
//
        (0..<10).forEach {
            let label = UILabel.cool(darkLabel, centerAlgin)
            label.apply {
                $0.numberOfLines = 1
            }
            stackView.addArrangedSubview(label)
            label.text = "\($0)"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

