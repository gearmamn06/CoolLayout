//
//  CollectionViewStyleViewController.swift
//  CoolLayout_Example
//
//  Created by sudo.park on 20/10/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

import CoolLayout

class NumberCell: UITableViewCell {
    
    let label = UILabel {
        $0.numberOfLines = 1
    }
    .apply(Deco.Label.headLine, Deco.Label.centerAlgin)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "NumberCell")
        
        self.selectionStyle = .none
        self.addSubview(label)
        label.activate {
            $0.centerXAnchor == self.centerXAnchor + 0
            $0.leadingAnchor >= self.leadingAnchor + 20
            $0.trailingAnchor <= self.trailingAnchor + -20
            $0.topAnchor == self.topAnchor + 30
            $0.bottomAnchor == self.bottomAnchor + -30
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}


struct ViewModel {
    let cellColor: UIColor
    let items: [Int]
}

class TableEmbedViewController: UIViewController {
    
    var viewModel: ViewModel!
    
    private let tableView = UITableView.lazy {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }
    .apply {
        $0.backgroundColor = UIColor.white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        setupTableView()
    }
}


extension TableEmbedViewController: UITableViewDataSource, UITableViewDelegate {
    
    private func setupTableView() {
        
        self.view.addSubview(tableView)
        tableView.activate {
            $0.leadingAnchor == self.view.leadingAnchor + 0
            $0.trailingAnchor == self.view.trailingAnchor + 0
            $0.topAnchor == self.view.topAnchor + 0
            $0.bottomAnchor == self.view.bottomAnchor + 0
        }
        
        tableView.register(NumberCell.self, forCellReuseIdentifier: "NumberCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = viewModel.items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "NumberCell") as! NumberCell
        cell.backgroundColor = viewModel.cellColor
        cell.label.text = "cell: \(item)"
        return cell
    }
}
