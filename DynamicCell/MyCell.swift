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
        photoImageView = UIImageView(frame: bounds)
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        photoImageView.contentMode = .ScaleAspectFit
        contentView.addSubview(photoImageView)
    }
    
    override func updateConstraintsIfNeeded() {
        super.updateConstraintsIfNeeded()
        
        let attributes: [NSLayoutAttribute] = [.Leading, .Trailing, .Top, .Bottom]
        let constraints = attributes.map { attribute in
            return NSLayoutConstraint(
                item: self.photoImageView,
                attribute: attribute,
                relatedBy: .Equal,
                toItem: self.contentView,
                attribute: attribute,
                multiplier: 1,
                constant: 0)
        }
        addConstraints(constraints)
    }
    
    internal var aspectConstraint : NSLayoutConstraint? {
        didSet {
            if let previousConstraint = oldValue {
                photoImageView.removeConstraint(previousConstraint)
            }
            if let newConstraint = aspectConstraint {
                photoImageView.addConstraint(newConstraint)
            }
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        aspectConstraint = nil
    }
    
    var photo: UIImage? {
        didSet {
            if let image = photo, imageView = photoImageView {
                let aspect = image.size.width / image.size.height
                aspectConstraint = NSLayoutConstraint(
                    item: imageView,
                    attribute: .Width,
                    relatedBy: .Equal,
                    toItem: imageView,
                    attribute: .Height,
                    multiplier: aspect,
                    constant: 0.0)
                imageView.image = image
            }
        }
    }
    

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
