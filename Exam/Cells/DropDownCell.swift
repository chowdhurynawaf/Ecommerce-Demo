//
//  DropDownCell.swift
//  Exam
//
//  Created by as on 11/23/20.
//  Copyright © 2020 nawaf. All rights reserved.
//

import UIKit

class DropDownCell : UITableViewCell {
    
    
    
    //MARK: - Properties
    
    let leftImgView : UIImageView = {
        let imgView = UIImageView()
        imgView.image = #imageLiteral(resourceName: "fast-delivery")
        imgView.setDimensions(width: 20, height: 20)
        return imgView
    }()
    
    let shippingText : UILabel = {
        let lbl = UILabel()
        lbl.text = "Shipping"
        lbl.font = UIFont(name: Fonts.SegoeUISemibold, size: 13)
        lbl.widthAnchor.constraint(equalToConstant: 70).isActive = true
        return lbl
    
    }()
    
    let estimattedDateText : UILabel = {
       
        let lbl = UILabel()
               lbl.text = "Estimatted Delivary 7-15 days"
               lbl.textColor = UIColor.rgb(red: 181, green: 181, blue: 181)
               lbl.font = UIFont(name: Fonts.SegoeUI, size: 13)
               return lbl
        
    }()
    
    let zDropPremiumShoppingBtn : UIButton = {
        let btn = UIButton()
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.rgb(red: 236, green: 236, blue: 236).cgColor
        btn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        btn.setTitle("zDrop Premium Shipping                 Cost BDT.4000", for: .normal)
        btn.titleLabel?.font = UIFont(name: Fonts.SegoeUI, size: 12)
        btn.setTitleColor(.black, for: .normal)
        
        
        btn.addRightImage(image: UIImage(named: "downarrow")!, offset: 15)
        
        btn.contentHorizontalAlignment = .left
        btn.contentVerticalAlignment = .top
        btn.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)

        
       return btn
        
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
        
        let titleStack = Utilities.shared.createHorizontalStackView(views: leftImgView,shippingText, spacing: 5, distribution: .fillProportionally)
        [titleStack,estimattedDateText,zDropPremiumShoppingBtn].forEach { (views) in
            addSubview(views)
        }
        
        titleStack.anchor(top:topAnchor,left: leftAnchor,paddingTop: 12,paddingLeft: 14)
        titleStack.heightAnchor.constraint(equalToConstant: 15).isActive = true
        estimattedDateText.anchor(top:topAnchor,right:rightAnchor,paddingTop: 8,paddingRight: 14)
        zDropPremiumShoppingBtn.anchor(top:titleStack.bottomAnchor,left: leftAnchor,bottom:bottomAnchor,right: rightAnchor,paddingTop: 12,paddingLeft: 14,paddingBottom: 15,paddingRight: 14)
        
        
    }
}
