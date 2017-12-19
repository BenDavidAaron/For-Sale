//
//  ProductCellTableViewCell.swift
//  For Sale
//
//  Created by Ben Aaron on 12-19-17.
//  Copyright © 2017 Ben Aaron. All rights reserved.
//

import UIKit

class ProductCellTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel:UILabel!
    @IBOutlet weak var priceLabel:UILabel!
    
    func configure(with product: Product) {
        titleLabel.text = product.title
        
    }
}
