//
//  Product.swift
//  For Sale
//
//  Created by Ben Aaron on 12-19-17.
//  Copyright © 2017 Ben Aaron. All rights reserved.
//

import Foundation

struct Product {
    let title: String
    let cost: Double
    
    func price() -> String {
        return String(format: "$%0.2f", cost)
    }
}
