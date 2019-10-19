//
//  Deco.swift
//  CoolLayout_Example
//
//  Created by sudo.park on 20/10/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit


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
