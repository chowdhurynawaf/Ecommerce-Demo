//
//  ShoeImageCell.swift
//  Exam
//
//  Created by as on 11/22/20.
//  Copyright © 2020 nawaf. All rights reserved.
//

import UIKit


protocol DetailsViewDelegate : class {
    func showDetailsViewController()
}

class ShoeImageCell : UITableViewCell {
    
    
    
    //MARK: - Properties
    
    weak var delegate:DetailsViewDelegate?
    
    
    private let twoColorLbl : UILabel = {
        
        let lbl = UILabel()
        lbl.font =  UIFont(name: Fonts.SegoeUISemibold, size: 12)
        lbl.text = "2 color , 4 size"
        return lbl
        
    }()
    
    
    
    lazy var shoeBtn: UIButton = {
        let btn = createShoeBtn()
        return btn
    }()
    
    lazy var shoeBtn2: UIButton = {
        let btn = createShoeBtn()
        return btn
    }()
    
    lazy var shoeBtn3: UIButton = {
        let btn = createShoeBtn()
        return btn
    }()
    
    lazy var shoeBtn4: UIButton = {
        let btn = createShoeBtn()
        return btn
    }()
    
    lazy var shoeBtn5: UIButton = {
        let btn = createShoeBtn()
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
    
    
    @objc func handleshoeBtnTapped() {
        print("gg")
        delegate?.showDetailsViewController()
        
    }
    
    //MARK: - helpers
    
    fileprivate func configureUI() {
        
        let upperTitleStack = Utilities.shared.createHorizontalStackView(views: twoColorLbl, spacing: 10, distribution: .fillEqually)
        let shoeBtnStack = Utilities.shared.createHorizontalStackView(views: shoeBtn,shoeBtn2,shoeBtn3,shoeBtn4,shoeBtn5 ,spacing: 4, distribution: .fillEqually)
        
        [upperTitleStack,shoeBtnStack].forEach { (views) in
            addSubview(views)
        }
        
        upperTitleStack.anchor(top:topAnchor,left: leftAnchor,paddingTop: 6,paddingLeft: 14)
        shoeBtnStack.anchor(top:upperTitleStack.bottomAnchor,left:leftAnchor,right: rightAnchor,paddingTop: 11,paddingLeft: 14,paddingRight: 14)
        
        
    }
    
    
    fileprivate func createShoeBtn()->UIButton {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .white
        btn.heightAnchor.constraint(equalToConstant: 62).isActive = true
        btn.widthAnchor.constraint(equalToConstant: 62).isActive = true
        btn.layer.cornerRadius = 1
        btn.addTarget(self, action: #selector(handleshoeBtnTapped), for: .touchUpInside)
        btn.clipsToBounds = true
        btn.imageView?.contentMode = .scaleAspectFill
        btn.layer.masksToBounds = true
        btn.layer.borderColor = UIColor.rgb(red: 236, green: 236, blue: 236).cgColor
        btn.layer.borderWidth = 1
        btn.setImage(UIImage(named: "shoe")?.withRenderingMode(.alwaysOriginal), for: .normal)
        
        return btn
    }
    
    
}


