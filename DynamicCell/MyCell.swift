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
    private var photoImageView: UIImageView!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .Default, reuseIdentifier: MyCell.identifier)
		commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        photoImageView = UIImageView(frame: bounds)
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        photoImageView.contentMode = .ScaleAspectFit
        contentView.addSubview(photoImageView)
        
        let verticalAttributes: [NSLayoutAttribute] = [.Top, .Bottom, .Leading, .Trailing]
        let verticalConstraints = verticalAttributes.map {attribute in
            return NSLayoutConstraint(
                item: photoImageView,
                attribute: attribute,
                relatedBy: .Equal,
                toItem: contentView,
                attribute: attribute,
                multiplier: 1,
                constant: 0)
        }
        NSLayoutConstraint.activateConstraints(verticalConstraints)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photo = nil
    }
    
    var photo: UIImage? {
        didSet {
            if let image = photo, imageView = photoImageView {
                imageView.image = image
                aspectConstraint = NSLayoutConstraint(
                    item: photoImageView,
                    attribute: .Height,
                    relatedBy: .Equal,
                    toItem: photoImageView,
                    attribute: .Width,
                    multiplier: image.aspectRatio,
                    constant: 0)
            }
        }
    }
    
    private var aspectConstraint : NSLayoutConstraint? {
        didSet {
            if let previousConstraint = oldValue {
                photoImageView.removeConstraint(previousConstraint)
            }
            if let newConstraint = aspectConstraint {
                photoImageView.addConstraint(newConstraint)
                newConstraint.active = true
            }
        }
    }
}

extension UIImage {
    var aspectRatio: CGFloat {
        return size.width == 0 ? 0 : size.height / size.width
    }
}
