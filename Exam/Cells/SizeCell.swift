//
//  SizeCell.swift
//  Exam
//
//  Created by as on 11/24/20.
//  Copyright © 2020 nawaf. All rights reserved.
//

import UIKit


class SizeCell : UITableViewCell {
    
    
    
    //MARK: - Properties
    
    
    
    private let SizeLbl : UILabel = {
        
        let lbl = UILabel()
        lbl.font =  UIFont(name: Fonts.SegoeUISemibold, size: 12)
        lbl.text = "Size"
        return lbl
        
    }()
    
    

    lazy var SBtn: UIButton = {
        let btn = createShoeBtn()
        btn.setTitle("S", for: .normal)
        return btn
    }()
    
    lazy var MBtn: UIButton = {
        let btn = createShoeBtn()
        btn.setTitle("M", for: .normal)

        return btn
    }()
    
    lazy var XBtn: UIButton = {
        
        let btn = createShoeBtn()
        btn.setTitle("X", for: .normal)

        return btn
    }()
    
    lazy var XLBtn: UIButton = {
        let btn = createShoeBtn()
        btn.setTitle("XL", for: .normal)

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
    
    
      @objc func handleSizeBtnTapped(sender:UIButton) {
        
        if sender == SBtn {
            SBtn.layer.borderColor = UIColor.rgb(red: 0, green: 181, blue: 91).cgColor
            
        }
        
        if sender == MBtn {
            MBtn.layer.borderColor = UIColor.rgb(red: 0, green: 181, blue: 91).cgColor
        }
        
        if sender == XBtn {
            XBtn.layer.borderColor = UIColor.rgb(red: 0, green: 181, blue: 91).cgColor
        }
        
        if sender == XLBtn {
            XLBtn.layer.borderColor = UIColor.rgb(red: 0, green: 181, blue: 91).cgColor
        }
        
       
        
    }
    
    //MARK: - helpers
    
    fileprivate func configureUI() {
        
        let upperTitleStack = Utilities.shared.createHorizontalStackView(views: SizeLbl, spacing: 10, distribution: .fillEqually)
        let shoeBtnStack = Utilities.shared.createHorizontalStackView(views: SBtn,MBtn,XBtn,XLBtn ,spacing: 4, distribution: .fillEqually)
        
        [upperTitleStack,shoeBtnStack].forEach { (views) in
            addSubview(views)
        }
        
        upperTitleStack.anchor(top:topAnchor,left: leftAnchor,paddingTop: 6,paddingLeft: 14)
        shoeBtnStack.anchor(top:upperTitleStack.bottomAnchor,left:leftAnchor,paddingTop: 11,paddingLeft: 14)
        shoeBtnStack.widthAnchor.constraint(equalToConstant: 240).isActive = true
        
    }
    
    
    fileprivate func createShoeBtn()->UIButton {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .white
        btn.titleLabel?.font = UIFont(name: Fonts.SegoeUISemibold, size: 13)
        btn.titleLabel?.textColor = .black
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.textAlignment = .center
        btn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        btn.widthAnchor.constraint(equalToConstant: 45).isActive = true
        btn.layer.cornerRadius = 1
        btn.addTarget(self, action: #selector(handleSizeBtnTapped), for: .touchUpInside)
        btn.clipsToBounds = true
        btn.layer.masksToBounds = true
        btn.layer.borderColor = UIColor.rgb(red: 236, green: 236, blue: 236).cgColor
        btn.layer.borderWidth = 1
        
        return btn
    }
    
    
}


