//
//  DescriptionCell.swift
//  Exam
//
//  Created by as on 11/23/20.
//  Copyright © 2020 nawaf. All rights reserved.
//

import UIKit


class DescriptionCell : UITableViewCell {
    
    
    //MARK: - Properties
    
    let imgView : UIImageView = {
       let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "Image 3")
        return iv
        
    }()
    
    //MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - helpers
    private func configureUI() {
        addSubview(imgView)
        imgView.fillSuperview()
        imgView.anchor(left:leftAnchor,bottom:bottomAnchor,right: rightAnchor,paddingLeft: 14,paddingBottom: 20,paddingRight: 14)
    }
    
}
