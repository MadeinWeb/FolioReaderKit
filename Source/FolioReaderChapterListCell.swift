//
//  FolioReaderChapterListCell.swift
//  FolioReaderKit
//
//  Created by Heberti Almeida on 07/05/15.
//  Copyright (c) 2015 Folio Reader. All rights reserved.
//

import UIKit

class FolioReaderChapterListCell: UITableViewCell {
    var indexLabel = UILabel()
    var bookmarkIcon = UIImageView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        var leftConstraint : NSLayoutConstraint
        var rightConstraint : NSLayoutConstraint
        var topConstraint : NSLayoutConstraint
        var botConstraint : NSLayoutConstraint
        
        
        

        
        indexLabel.lineBreakMode = .byWordWrapping
        indexLabel.numberOfLines = 0
        indexLabel.translatesAutoresizingMaskIntoConstraints = false
        indexLabel.font = UIFont(name: "Avenir-Light", size: 17)
        indexLabel.textColor = readerConfig.menuTextColor
        
        
        
        
        contentView.addSubview(indexLabel)
       
        
        // Configure cell contraints
        var constraints = [NSLayoutConstraint]()
        let views = ["label": self.indexLabel]
        
        NSLayoutConstraint.constraints(withVisualFormat: "H:|-15-[label]-15-|", options: [], metrics: nil, views: views).forEach {
            constraints.append($0 as NSLayoutConstraint)
        }
        
        NSLayoutConstraint.constraints(withVisualFormat: "V:|-16-[label]-16-|", options: [], metrics: nil, views: views).forEach {
            constraints.append($0 as NSLayoutConstraint)
        }
        
        contentView.addConstraints(constraints)
        
        
        
//        bookmarkIcon = UIImageView()
        bookmarkIcon.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(bookmarkIcon)
        
        rightConstraint = NSLayoutConstraint.init(item: bookmarkIcon, attribute: .right, relatedBy: .equal,
                                                  toItem: contentView, attribute: .right,
                                                  multiplier: 1.0, constant: -16)
        
        topConstraint = NSLayoutConstraint.init(item: bookmarkIcon, attribute: .top, relatedBy: .equal, toItem: contentView, attribute: .top, multiplier: 1, constant: 16)
        
        
        
        leftConstraint = NSLayoutConstraint.init(item: bookmarkIcon, attribute: .width, relatedBy: .equal,
                                                 toItem: nil, attribute: .notAnAttribute,
                                                 multiplier: 1, constant: 23)
        
        
        botConstraint = NSLayoutConstraint.init(item: bookmarkIcon, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 23)
        
        contentView.addConstraints([rightConstraint, topConstraint])
        bookmarkIcon.addConstraint(leftConstraint)
        bookmarkIcon.addConstraint(botConstraint)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("storyboards are incompatible with truth and beauty")
    }
}
