//
//  DetailsViewController.swift
//  Exam
//
//  Created by as on 11/23/20.
//  Copyright © 2020 nawaf. All rights reserved.
//

import UIKit

class DetailsViewController : UIViewController {
    
    
    //MARK: - Properties
    let DropDownCellIdentifier = "DropDownCellIdentifier"
    let PantImageCellIdentifier = "PantImageCell"
    let SizeCellIdentifier = "SizeCell"
    let QuantityCellIdentifer = "QuantityCellIdentifer"
    
    let imageArray : [UIImage] = [#imageLiteral(resourceName: "Image 3"),#imageLiteral(resourceName: "shoe")]
    let tableView = UITableView()
    
    /*ImageView for on header*/
    
    lazy var iv : UIImageView = {
        
        let iv = UIImageView()
        iv.image = imageArray.first
        iv.clipsToBounds = true
        iv.layer.masksToBounds = true
        iv.setDimensions(width: 264, height: 264)
        
        iv.layer.cornerRadius = 12
        
        return iv
    }()
    
    
    
    /*RightButton on the right side of ImageView*/
    lazy var rightBtn : UIButton = {
        let rightBtn = UIButton()
        //rightBtn.setImage(#imageLiteral(resourceName: "downarrow"), for: .normal)
        rightBtn.setImage(UIImage.init(systemName: "chevron.right"), for: .normal)
        rightBtn.backgroundColor = #colorLiteral(red: 0.07999999821, green: 0.07999999821, blue: 0.07999999821, alpha: 0.2540667808)
        rightBtn.setDimensions(width: 30, height: 30)
        rightBtn.layer.cornerRadius = 15
        rightBtn.tintColor = .white
        rightBtn.layer.masksToBounds = true
        rightBtn.addTarget(self, action: #selector(handleRightBtnTapped), for: .touchUpInside)
        return rightBtn
    }()
    
    
    
    /*Leftbutton on the right side of ImageView*/
    
    lazy var leftBtn : UIButton = {
        let leftBtn = UIButton()
        //rightBtn.setImage(#imageLiteral(resourceName: "downarrow"), for: .normal)
        leftBtn.setImage(UIImage.init(systemName: "chevron.left"), for: .normal)
        leftBtn.backgroundColor = #colorLiteral(red: 0.07999999821, green: 0.07999999821, blue: 0.07999999821, alpha: 0.25)
        leftBtn.setDimensions(width: 30, height: 30)
        leftBtn.isHidden = true
        leftBtn.layer.cornerRadius = 15
        leftBtn.tintColor = .white
        leftBtn.layer.masksToBounds = true
        leftBtn.addTarget(self, action: #selector(handleLeftBtnTapped), for: .touchUpInside)
        return leftBtn
    }()
    
    
    
    /* header contains imageView and left,right buttons */
    
    lazy var headerViewOfDetailsViewCsontroller : UIView = {
        
        let view = UIView()
        view.addSubview(iv)
        view.addSubview(leftBtn)
        view.addSubview(rightBtn)
        
        iv.center(inView: view, yConstant: 10)
        
        
        leftBtn.anchor(top:iv.topAnchor,left:iv.leftAnchor,paddingTop: 120,paddingLeft: -40)
        rightBtn.anchor(top:iv.topAnchor,right: iv.rightAnchor,paddingTop: 120,paddingRight: -40)
        
        let lbl = UILabel()
        lbl.font = UIFont(name: Fonts.SegoeUISemibold, size: 17)
        lbl.text = "BDT.2850-BDT.1850"
        lbl.backgroundColor = .white
        
        view.addSubview(lbl)
        
        lbl.center(inView: iv, yConstant: 145)
        
        let crossBtn  = UIButton()
        crossBtn.setDimensions(width: 50, height: 50)
        crossBtn.layer.cornerRadius = 25
        crossBtn.setImage(UIImage.init(systemName: "xmark"), for: .normal)
        crossBtn.addTarget(self, action: #selector(handleCross), for: .touchUpInside)
        crossBtn.tintColor = UIColor.lightGray
        
        view.addSubview(crossBtn)
        crossBtn.anchor(top:view.topAnchor,left:view.leftAnchor,paddingTop: 7,paddingLeft: 4)
        
        
        return view
        
    }()
    
    
    
    //MARK: - Lifecycle
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
        
        
    }
    
    
    //MARK: - API
    
    
    //MARK: - Selectors
    
    @objc func handleRightBtnTapped() {
        print("hola")
        iv.image = imageArray.last
        rightBtn.isHidden = true
        leftBtn.isHidden = false
        
        
    }
    
    @objc func handleLeftBtnTapped() {
        iv.image = imageArray.first
        leftBtn.isHidden = true
        rightBtn.isHidden = false
    }
    
    @objc func handleCross() {
        dismiss(animated: true, completion: nil)
    }
    
    
    //MARK: - helpers
    
    fileprivate func configUI() {
        view.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.fillSuperview()
        
        tableView.register(DropDownCell.self, forCellReuseIdentifier: DropDownCellIdentifier)
        tableView.register(PantImageCell.self, forCellReuseIdentifier: PantImageCellIdentifier)
        tableView.register(SizeCell.self, forCellReuseIdentifier: SizeCellIdentifier)
        tableView.register(QuantityCell.self, forCellReuseIdentifier: QuantityCellIdentifer)
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 80
        
        tableView.tableHeaderView = headerViewOfDetailsViewCsontroller
        headerViewOfDetailsViewCsontroller.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 320)
        tableView.tableFooterView = UIView()
    }
    
}


//MARK: - extensions

//TableView Delegate and DataSource Methods

extension DetailsViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            
            let cell = PantImageCell()
            cell.heightAnchor.constraint(equalToConstant: 120).isActive = true
            cell.selectionStyle = .none
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
            return cell
        }
        
        if indexPath.row == 1 {
            
            let cell = SizeCell()
            cell.heightAnchor.constraint(equalToConstant: 85).isActive = true
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
            cell.selectionStyle = .none
            
            return cell
        }
        
        
        if indexPath.row == 2 {
            
            let cell = QuantityCell()
            cell.heightAnchor.constraint(equalToConstant: 60).isActive = true
            cell.selectionStyle = .none
            
            return cell
        }
            
        else {
            
            let cell = DropDownCell()
            
            return cell
        }
    }
    
    
    
}
