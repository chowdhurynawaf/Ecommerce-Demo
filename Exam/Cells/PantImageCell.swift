//
//  PantImageCell.swift
//  Exam
//
//  Created by as on 11/24/20.
//  Copyright © 2020 nawaf. All rights reserved.
//

import UIKit


class PantImageCell : UITableViewCell {
    
    
    
    //MARK: - Properties
    
    
    
    private let ColorLbl : UILabel = {
        
        let lbl = UILabel()
        lbl.font =  UIFont(name: Fonts.SegoeUISemibold, size: 12)
        lbl.text = "Color"
        return lbl
        
    }()
    
    
    lazy var pantBtn: UIButton = {
        let btn = createPantBtn()
        return btn
    }()
    
    lazy var pantBtn2: UIButton = {
        let btn = createPantBtn()
        return btn
    }()
    
    lazy var pantBtn3: UIButton = {
        let btn = createPantBtn()
        return btn
    }()
    
    lazy var pantBtn4: UIButton = {
        let btn = createPantBtn()
        return btn
    }()
    
    lazy var pantBtn5: UIButton = {
        let btn = createPantBtn()
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
    
    
    
    
    //MARK: - Selectors
    
    
    @objc func handlePantBtnTapped(sender:UIButton) {
        print("kk")
        
        if sender == pantBtn {
            pantBtn.layer.borderColor = UIColor.rgb(red: 0, green: 181, blue: 91).cgColor
            
        }
        
        if sender == pantBtn2 {
            pantBtn2.layer.borderColor = UIColor.rgb(red: 0, green: 181, blue: 91).cgColor
        }
        
        if sender == pantBtn3 {
            pantBtn3.layer.borderColor = UIColor.rgb(red: 0, green: 181, blue: 91).cgColor
        }
        
        if sender == pantBtn4 {
            pantBtn4.layer.borderColor = UIColor.rgb(red: 0, green: 181, blue: 91).cgColor
        }
        
        if sender == pantBtn5 {
            pantBtn5.layer.borderColor = UIColor.rgb(red: 0, green: 181, blue: 91).cgColor
        }
        
    }
    
    //MARK: - helpers
    
    fileprivate func configureUI() {
        
        let upperTitleStack = Utilities.shared.createHorizontalStackView(views: ColorLbl, spacing: 10, distribution: .fillEqually)
        let PantStack = Utilities.shared.createHorizontalStackView(views: pantBtn,pantBtn2,pantBtn3,pantBtn4,pantBtn5 ,spacing: 4, distribution: .fillEqually)
        
        [upperTitleStack,PantStack].forEach { (views) in
            addSubview(views)
        }
        
        upperTitleStack.anchor(top:topAnchor,left: leftAnchor,paddingTop: 10,paddingLeft: 14)
        PantStack.anchor(top:upperTitleStack.bottomAnchor,left:leftAnchor,right: rightAnchor,paddingTop: 11,paddingLeft: 14,paddingRight: 14)
        PantStack.widthAnchor.constraint(equalToConstant: 245).isActive = true
        
        
    }
    
    
    fileprivate func createPantBtn()->UIButton {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .white
        btn.heightAnchor.constraint(equalToConstant: 62).isActive = true
        btn.widthAnchor.constraint(equalToConstant: 62).isActive = true
        btn.addTarget(self, action: #selector(handlePantBtnTapped), for: .touchDown)
        btn.clipsToBounds = true
        btn.imageView?.contentMode = .scaleAspectFill
        btn.layer.masksToBounds = true
        btn.layer.borderColor = UIColor.rgb(red: 236, green: 236, blue: 236).cgColor
        btn.layer.borderWidth = 1
        btn.setImage(UIImage(named: "Image 3")?.withRenderingMode(.alwaysOriginal), for: .normal)
        
        return btn
    }
    

    
    
}


