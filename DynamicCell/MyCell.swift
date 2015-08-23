//
//  MyCell.swift
//  DynamicTable
//
//  Created by Ioannis Kaliakatsos on 21/08/2015.
//  Copyright (c) 2015 Ioannis Kaliakatsos. All rights reserved.
//

import UIKit

class MyCell: UITableViewCell {
    
    static let identifier = "cell identifier"
    var photoImageView: UIImageView!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .Default, reuseIdentifier: MyCell.identifier)
        setTranslatesAutoresizingMaskIntoConstraints(false)
        photoImageView = UIImageView(image: UIImage(named: "photo"))
        photoImageView.contentMode = .ScaleAspectFit
        contentView.addSubview(photoImageView)
        setNeedsUpdateConstraints()
    }
    
    override func updateConstraintsIfNeeded() {
        let viewAttributes: [NSLayoutAttribute] = [.Top, .Trailing, .Leading, .Bottom]
        for attribute in viewAttributes {
            let constraint = NSLayoutConstraint(
                item: photoImageView,
                attribute: attribute,
                relatedBy: .Equal,
                toItem: self,
                attribute: attribute,
                multiplier: 1,
                constant: 0)
            addConstraint(constraint)
        }
        
        super.updateConstraints()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
