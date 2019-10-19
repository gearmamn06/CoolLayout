//
//  ViewController.swift
//  CoolLayout
//
//  Created by gearmamn06@gmail.com on 10/13/2019.
//  Copyright (c) 2019 gearmamn06@gmail.com. All rights reserved.
//

import UIKit

import CoolLayout

class OldStyleViewController: UIViewController {
    
    private var explainLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "Click the button below to open next viewController"
        return label
    }()
    
    private var showButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Show", for: .normal)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.addSubview(explainLabel)
        NSLayoutConstraint.activate([
            explainLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            explainLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            explainLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
        
        self.view.addSubview(showButton)
        NSLayoutConstraint.activate([
            showButton.topAnchor.constraint(equalTo: explainLabel.bottomAnchor, constant: 20),
            showButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        
        showButton.addTarget(self, action: #selector(showNextViewController), for: .touchUpInside)
    }

    
    @objc private func showNextViewController() {
        
        let navigationController = UINavigationController(navigationBarClass: nil, toolbarClass: nil)
        let dest = NewStyleViewController {
            $0.view.backgroundColor = UIColor.white
        }
        navigationController.pushViewController(dest, animated: true)
        
        self.present(navigationController, animated: true, completion: nil)
    }

}
