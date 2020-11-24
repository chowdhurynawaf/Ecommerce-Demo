//
//  HomePageController.swift
//  Exam
//
//  Created by as on 11/22/20.
//  Copyright © 2020 nawaf. All rights reserved.
//

import UIKit

class HomePageController: UIViewController {
    
    //MARK: - Properties
    
    let shoeCellIdentifier = "shoeCell"
    let DropDownCellIdentiier = "DropDownCell"
    let descriptionIdentifier = "DescriptionCell"
    let fullDescriptionCellIdentifier = "FullDescriptionCell"


    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    @IBOutlet weak var backButton: UIButton!
    
    
    
    
    /* this view will appear if scroolView
     cross 320 at y position
     
     */
    
    lazy var whiteViewForNav : UIView = {
        
        
        let searchBtn = UIButton()
        let dunderBtn = UIButton()
        let dotBtn = UIButton()

       
        let whiteview  = UIView()
        whiteview.backgroundColor = .white
        
        let backButtonForWhiteNav = UIButton()
        backButtonForWhiteNav.setDimensions(width: 26, height: 26)
        backButtonForWhiteNav.setImage(UIImage.init(systemName: "chevron.left"), for: .normal)
        backButtonForWhiteNav.tintColor = .lightGray
        backButtonForWhiteNav.layer.cornerRadius = 13
        whiteview.addSubview(backButtonForWhiteNav)
        
                let btn = UIButton()
                btn.tintColor = .white
                btn.setDimensions(width: 68, height: 26)
                btn.layer.cornerRadius = 12
                
                
                searchBtn.setImage(#imageLiteral(resourceName: "search-2-line"), for: .normal)
                
                dunderBtn.setTitle("|", for: .normal)
                dunderBtn.setTitleColor(.lightGray, for: .normal)
                dunderBtn.setDimensions(width: 22, height: 22)
                
                
                dotBtn.setImage(#imageLiteral(resourceName: "dot"), for: .normal)
                
                let stack = Utilities.shared.createHorizontalStackView(views: searchBtn,dunderBtn,dotBtn, spacing: 1, distribution: .fillEqually)
                
                btn.addSubview(stack)
                stack.center(inView: btn)
                stack.alignment = .leading
                stack.anchor(left:btn.leftAnchor,right: btn.rightAnchor,paddingLeft: 3,paddingRight: 3)
        
        whiteview.addSubview(btn)
        whiteview.heightAnchor.constraint(equalToConstant: 46).isActive = true
        
        btn.anchor(top:whiteview.topAnchor,right:whiteview.rightAnchor,paddingTop: 12,paddingRight: 12)
        
        backButtonForWhiteNav.anchor(top:whiteview.topAnchor,left:whiteview.leftAnchor,paddingTop: 12,paddingLeft: 12)
 

        
        return whiteview
        
        
    }()
    
    
    /*cart button with a label */
    
    lazy var cartBtn : UIButton = {
       
        let btn = Utilities.shared.attributedButtonWithImageOnEnd(Line: "", size: 0, image: #imageLiteral(resourceName: "Group 8833"), color: .green)
        btn.setDimensions(width: 50, height: 50)
        btn.backgroundColor = UIColor.rgb(red: 233, green: 255, blue: 245)
        
        
        let lbl = UILabel()
        lbl.setDimensions(width: 16, height: 16)
        lbl.text = "1"
        lbl.textAlignment = .center
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.layer.cornerRadius = 8
        lbl.backgroundColor = UIColor.rgb(red: 0, green: 181, blue: 91)
        lbl.layer.masksToBounds = true
        
        btn.addSubview(lbl)
        
        lbl.centerY(inView: btn, leftAnchor: btn.rightAnchor, paddingLeft: -22, constant: -6)
        
        return btn
    
    }()
    
    
    
    lazy var AddtocartBtn : UIButton = {
       
        let btn = UIButton()
        btn.setTitle("ADD TO CART", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont(name: Fonts.SegoeUISemibold, size: 15)
        btn.setDimensions(width: 160, height: 50)
        btn.backgroundColor = UIColor.rgb(red: 0 , green: 142, blue: 71)
        

        return btn

    }()
    
    lazy var BuynowBtn : UIButton = {
       
        let btn = UIButton()
        btn.setTitle("BUY NOW", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont(name: Fonts.SegoeUISemibold, size: 15)
        btn.setDimensions(width: 160, height: 50)
        btn.backgroundColor = UIColor.rgb(red: 0 , green: 181, blue: 91)
        

        return btn

    }()
    
    
    
    /*This menu button cantains three button
     with image and string.
     and displayed on the top right side */
    
    lazy var searchAndMenuBtn : UIButton = {
        
        
        let searchBtn = UIButton()
        let dunderBtn = UIButton()
        let dotBtn = UIButton()

        
        let btn = UIButton()
        btn.tintColor = .white
        btn.setDimensions(width: 68, height: 26)
        btn.layer.cornerRadius = 12
        btn.backgroundColor = #colorLiteral(red: 0.07999999821, green: 0.07999999821, blue: 0.07999999821, alpha: 0.4)
        
        
        searchBtn.setImage(#imageLiteral(resourceName: "search-2-line-1"), for: .normal)
        
        dunderBtn.setTitle("|", for: .normal)
        dunderBtn.setTitleColor(.white, for: .normal)
        dunderBtn.setDimensions(width: 22, height: 22)
        
        
        dotBtn.setImage(#imageLiteral(resourceName: "blueDot"), for: .normal)
        
        let stack = Utilities.shared.createHorizontalStackView(views: searchBtn,dunderBtn,dotBtn, spacing: 1, distribution: .fillEqually)
        
        btn.addSubview(stack)
        stack.center(inView: btn)
        stack.alignment = .leading
        stack.anchor(left:btn.leftAnchor,right: btn.rightAnchor,paddingLeft: 3,paddingRight: 3)
        return btn

        
    }()
    
    
    
    
    
    
    //MARK: - Lifecycle


  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()

    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    
    //MARK: - helpers
    
    fileprivate func configUI() {
          tableView.fillSuperview()
          tableView.delegate = self
          tableView.dataSource = self
          tableView.contentInsetAdjustmentBehavior = .never
          tableView.register(ShoeImageCell.self, forCellReuseIdentifier: shoeCellIdentifier)
          tableView.register(DropDownCell.self, forCellReuseIdentifier: DropDownCellIdentiier)
          tableView.register(DescriptionCell.self, forCellReuseIdentifier: descriptionIdentifier)
          tableView.register(FullDescriptionCell.self, forCellReuseIdentifier: fullDescriptionCellIdentifier)
          
          backButton.layer.cornerRadius = 13
          
          
          let stack = Utilities.shared.createHorizontalStackView(views: cartBtn,AddtocartBtn,BuynowBtn, spacing: 0, distribution: .fillProportionally)
          
          view.addSubview(stack)
          view.addSubview(whiteViewForNav)
          view.addSubview(searchAndMenuBtn)
          searchAndMenuBtn.anchor(top:view.topAnchor,right: view.rightAnchor,paddingTop: 12,paddingRight: 12)
          stack.anchor(left: view.leftAnchor,bottom:view.bottomAnchor,right:view.rightAnchor,paddingLeft: 0,paddingBottom: 0,paddingRight: 0)
          whiteViewForNav.anchor(top:view.topAnchor,left: view.leftAnchor,right: view.rightAnchor)
          whiteViewForNav.isHidden = true
      }
}



   //MARK: - extensions

   // TableViewDelegate and Datasources
extension HomePageController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 11
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PriceAndDescriptionCell", for: indexPath) as! PriceAndDescriptionTableViewCell
            cell.strikeThroughLabel.attributedText = "BDT.3050".strikeThrough()
            cell.twentyFivePerCentLabel.layer.cornerRadius = 10
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
            cell.selectionStyle = .none



            return cell
        }
        
        if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: shoeCellIdentifier, for: indexPath) as! ShoeImageCell
            cell.delegate = self
        

            return cell
        }
        
        if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: DropDownCellIdentiier, for: indexPath) as! DropDownCell
            return cell
        }
        

        if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RepeatedCellIdentifier", for: indexPath)
            return cell
        }
        
        
        if indexPath.row == 4 {
                  let cell = tableView.dequeueReusableCell(withIdentifier: "RepeatedCellIdentifier2", for: indexPath)
                  return cell
              }
        
        if indexPath.row == 5 {
                  let cell = tableView.dequeueReusableCell(withIdentifier: "RepeatedCellIdentifier3", for: indexPath)
                  return cell
              }
        
        if indexPath.row == 6 {
                  let cell = tableView.dequeueReusableCell(withIdentifier: "RepeatedCellIdentifier4", for: indexPath)
                  return cell
              }
        
        if indexPath.row == 7 {
                  let cell = tableView.dequeueReusableCell(withIdentifier: "RepeatedCellIdentifier5", for: indexPath)
                  return cell
              }
        if indexPath.row == 8 {
                  let cell = tableView.dequeueReusableCell(withIdentifier: "RepeatedCellIdentifier6", for: indexPath)
                  return cell
              }
        
        
        
        if indexPath.row == 9 {
            let cell = tableView.dequeueReusableCell(withIdentifier: descriptionIdentifier, for: indexPath)
            return cell
        }
        
        else {
           
            
            let cell = tableView.dequeueReusableCell(withIdentifier: fullDescriptionCellIdentifier, for: indexPath)
            cell.selectionStyle = .none
            return cell
        }
        
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 150
        }
        
        if indexPath.row == 1 {
            return 100
        }
         
        if indexPath.row == 2 {
            return 100
        }
        
        
        if 3 ... 8 ~= indexPath.row  {
            return 50
        }
        
        
        if indexPath.row == 9 {
            return 388
        }
        
        
        else {
            return 315

        }
    }
}


/*protocol implementation*/

extension HomePageController : DetailsViewDelegate {
    func showDetailsViewController() {
        present(DetailsViewController(), animated: true, completion: nil)
    }
}



/*ScroolView delegate helps to calculate
 offset of y and taking decsion wheather
 whitenav should be display or not
 */

extension HomePageController: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        if(scrollView.contentOffset.y > 320){
            
            
            whiteViewForNav.isHidden = false
            searchAndMenuBtn.isHidden = true
        }
        else{
            whiteViewForNav.isHidden = true
            searchAndMenuBtn.isHidden = false
            backButton.isHidden = false
        }
    }
}
