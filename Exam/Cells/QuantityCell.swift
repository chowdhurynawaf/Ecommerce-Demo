//
//  QuantityCell.swift
//  Exam
//
//  Created by as on 11/24/20.
//  Copyright © 2020 nawaf. All rights reserved.
//

import UIKit

class QuantityCell : UITableViewCell
{
    
    
    
    //Header "QUANTITY
    
    lazy var lbl : UILabel =  {
        
            let lbl = UILabel()
            lbl.font =  UIFont(name: Fonts.SegoeUISemibold, size: 12)
            lbl.text = "Quantity"
            return lbl
            
    }()
    
    lazy var numberLbl : UILabel =  {
        
            let lbl = UILabel()
            lbl.font =  UIFont(name: Fonts.SegoeUISemibold, size: 12)
            lbl.text = "1"
            lbl.textAlignment = .center
            return lbl
    }()
    
    
    lazy var plusBtn : UIButton = {
       
        let btn = UIButton()
        btn.setDimensions(width: 50, height: 50)
        btn.setImage(UIImage.init(systemName: "plus.circle.fill"), for: .normal)
        btn.tintColor = UIColor.rgb(red: 0, green: 181, blue: 91)
        
        return btn
        
    }()
    
    
    lazy var minusBtn : UIButton = {
       
        let btn = UIButton()
        btn.setDimensions(width: 50, height: 50)
        btn.setImage(UIImage.init(systemName: "minus.circle.fill"), for: .normal)
        btn.tintColor = .lightGray
        
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
        
        let stack = Utilities.shared.createHorizontalStackView(views: lbl,minusBtn,numberLbl,plusBtn, spacing: 2, distribution: .fillEqually)
        addSubview(stack)
        stack.anchor(left:leftAnchor,paddingLeft: 14)
        stack.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    
}
