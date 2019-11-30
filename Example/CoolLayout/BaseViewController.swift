//
//  ViewController.swift
//  CoolLayout
//
//  Created by gearmamn06@gmail.com on 10/13/2019.
//  Copyright (c) 2019 gearmamn06@gmail.com. All rights reserved.
//

import UIKit

import CoolLayout

class BaseViewController: UIViewController {
    
    private var explainLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "Click the button below to open next viewController\n(The current screen is written in the basic way of writing the view in code.)"
        return label
    }()
    
    private var showStackButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("StackView", for: .normal)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        return button
    }()
    
    private var showTableButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("TableView", for: .normal)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        return button
    }()
    
    private var showCircleButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Circle", for: .normal)
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
            explainLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -40)
        ])
        
        self.view.addSubview(showStackButton)
        NSLayoutConstraint.activate([
            showStackButton.topAnchor.constraint(equalTo: explainLabel.bottomAnchor, constant: 20),
            showStackButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        
        self.view.addSubview(showTableButton)
        NSLayoutConstraint.activate([
            showTableButton.topAnchor.constraint(equalTo: showStackButton.bottomAnchor, constant: 20),
            showTableButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        
        self.view.addSubview(showCircleButton)
        NSLayoutConstraint.activate([
            showCircleButton.topAnchor.constraint(equalTo: self.showTableButton.bottomAnchor, constant: 20),
            showCircleButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        
        showStackButton.addTarget(self, action: #selector(openStackEmbedViewController), for: .touchUpInside)
        
        showTableButton.addTarget(self, action: #selector(openTableViewEmbedViewController), for: .touchUpInside)
        
        showCircleButton.addTarget(self, action: #selector(openCircleViewController), for: .touchUpInside)
    }

    
    @objc private func openStackEmbedViewController() {
        
        let dest = StackEmbedViewController {
            $0.view.backgroundColor = UIColor.white
        }
        openNext(nextViewController: dest)
    }
    
    @objc private func openTableViewEmbedViewController() {
        let dest = TableEmbedViewController {
            let items = (0..<10).map{ $0 }
            $0.viewModel = ViewModel(cellColor: UIColor.red, items: items)
        }
        openNext(nextViewController: dest)
    }
    
    @objc private func openCircleViewController() {
        let dest = CircleViewController()
        openNext(nextViewController: dest)
    }
    
    
    private func openNext(nextViewController: UIViewController) {
        let navigationController = UINavigationController(navigationBarClass: nil,
                                                          toolbarClass: nil)
        
        navigationController.pushViewController(nextViewController, animated: true)
        
        self.present(navigationController, animated: true, completion: nil)
    }

}
