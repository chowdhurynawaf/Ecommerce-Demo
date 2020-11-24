//
//  FullDescriptionCell.swift
//  Exam
//
//  Created by as on 11/23/20.
//  Copyright © 2020 nawaf. All rights reserved.
//

import UIKit

class FullDescriptionCell : UITableViewCell {
    
    
    //MARK: - Properties
    
    let imgView : UIImageView = {
       let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "Image 3")
        return iv
        
    }()
    
    let imgView2 : UIImageView = {
          let iv = UIImageView()
           iv.image = #imageLiteral(resourceName: "Image 3")
           return iv
           
       }()
    let fullDescriptionText : UILabel =  {
       
        let lbl = UILabel()
        lbl.text = "view full description"
        lbl.font = UIFont(name: Fonts.SegoeUI, size: 12)
        lbl.textColor = .black
        return lbl
    }()
       
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private func configureUI() {
        
        
        let stack = Utilities.shared.createHorizontalStackView(views: imgView,imgView2, spacing: 5, distribution: .fillEqually)
        addSubview(stack)
        addSubview(fullDescriptionText)
        
        
        stack.anchor(top:topAnchor,left: leftAnchor,right: rightAnchor,paddingTop: 20,paddingLeft: 14,paddingRight: 14)
        fullDescriptionText.center(inView: stack, yConstant: 170)
        stack.fillSuperview()
    }
    
}
