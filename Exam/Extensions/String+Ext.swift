//
//  String+Ext.swift
//  Exam
//
//  Created by as on 11/22/20.
//  Copyright © 2020 nawaf. All rights reserved.
//

import UIKit

//cuts line 
extension String {
    func strikeThrough() -> NSAttributedString {
        let attributeString =  NSMutableAttributedString(string: self)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0,attributeString.length))
        return attributeString
    }
}
