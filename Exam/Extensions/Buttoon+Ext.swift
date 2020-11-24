//
//  Buttoon+Ext.swift
//  Exam
//
//  Created by as on 11/23/20.
//  Copyright © 2020 nawaf. All rights reserved.
//

import UIKit


extension UIButton {

func addRightImage(image: UIImage, offset: CGFloat) {
    self.setImage(image, for: .normal)
    self.imageView?.translatesAutoresizingMaskIntoConstraints = false
    self.imageView?.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0.0).isActive = true
    self.imageView?.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -offset).isActive = true
}

}
