//
//  Utils.swift
//  Exam
//
//  Created by as on 11/23/20.
//  Copyright © 2020 nawaf. All rights reserved.
//

import UIKit

class Utilities {
    
    static let shared = Utilities()
    
    

//this function will return a title with Image at first position . i.e - 😊Hello
    

    /// - Parameters:
    ///   - Line: takes title string
    ///   - size: title size
    ///   - image: image of first position
    ///   - color: color of title
    /// - Returns: button with image on first postion
    func attributedButtonWithImage(Line:String,size:CGFloat,image:UIImage,color:UIColor)->UIButton {

         let btn = UIButton(type: .system)



        let attributedTitle = NSMutableAttributedString(string: Line, attributes: [NSAttributedString.Key.font:UIFont(name: Fonts.SegoeUISemibold, size: size),
        NSMutableAttributedString.Key.foregroundColor : color ]  )


        // create our NSTextAttachment
        let image1Attachment = NSTextAttachment()
        image1Attachment.image = image

        // wrap the attachment in its own attributed string so we can append it
        let image1String = NSAttributedString(attachment: image1Attachment)

        // create an NSMutableAttributedString that we'll append everything to
//        let fullString = NSMutableAttributedString(string: attributedTitle)


        // add the NSTextAttachment wrapper to our full string, then add some more text.
        attributedTitle.insert(image1String, at: 0)

        // draw the result in a label
        btn.setAttributedTitle(attributedTitle, for: .normal)


        return btn

    }

    
    
    //this function will return a button with a image on the end of title i.e : Hello😊
    
    
    /// - Parameters:
    ///   - Line: takes title string
    ///   - size: title size
    ///   - image: image of first position
    ///   - color: color of title
    /// - Returns: button with image on last postion
    
    
    func attributedButtonWithImageOnEnd(Line:String,size:CGFloat,image:UIImage,color:UIColor)->UIButton {

             let btn = UIButton(type: .system)

             let attributedTitle = NSMutableAttributedString(string: Line, attributes: [NSAttributedString.Key.font:UIFont(name: Fonts.SegoeUISemibold, size: size),
                                                                                             NSMutableAttributedString.Key.foregroundColor : color ]  )


            // create our NSTextAttachment
            let image1Attachment = NSTextAttachment()
            image1Attachment.image = image

            // wrap the attachment in its own attributed string so we can append it
            let image1String = NSAttributedString(attachment: image1Attachment)


            // add the NSTextAttachment wrapper to our full string, then add some more text.
            attributedTitle.append(image1String)

            // draw the result in a label
            btn.setAttributedTitle(attributedTitle, for: .normal)


            return btn

        }

    
    
    
    //This funciton takes variadic UIViews and creates vertical stackView
    
    
    
    
    /// - Parameters:
    ///   - views: views for stackView
    ///   - spacing: spacing between views
    ///   - distribution: distributioin
    /// - Returns: vertical stackView
    func                     createVerticalStackView(views:UIView...,spacing:CGFloat,distribution:UIStackView.Distribution)->UIStackView{
        
        let verticalStackView = UIStackView(arrangedSubviews: views)
        verticalStackView.axis = .vertical
        verticalStackView.spacing = spacing
        verticalStackView.distribution = distribution
        
        return verticalStackView
        
    }
    
    
    //This funciton takes variadic UIViews and creates horizontal stackView
    
    /// - Parameters:
      ///   - views: views for stackView
      ///   - spacing: spacing between views
      ///   - distribution: distributioin
      /// - Returns: horizontal stackView
    func                     createHorizontalStackView(views:UIView...,spacing:CGFloat,distribution:UIStackView.Distribution)->UIStackView{
        
        let horizontalStackView = UIStackView(arrangedSubviews: views)
        horizontalStackView.axis = .horizontal
        horizontalStackView.spacing = spacing
        horizontalStackView.distribution = distribution
        
        
        return horizontalStackView
        
    }

}
