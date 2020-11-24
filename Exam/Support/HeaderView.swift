//
//  HeaderView.swift
//  Exam
//
//  Created by as on 11/22/20.
//  Copyright © 2020 nawaf. All rights reserved.
//

import UIKit

class HeaderView : UIView {
    
    lazy var imgView : UIImageView = {
       
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "Image 3")
        return iv
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
       // fatalError("init(coder:) has not been implemented")
        super.init(coder: coder)
        configure()
    }
    
    
    private func configure() {
        

        
        imgView.fillSuperview()
    }
}
