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
    
    init(title: String, cost: Double) {
        self.title = title
        self.cost = cost
    }
    
    init?(valueDict: [String: Any]) {
        guard let title = valueDict["title"] as? String,
            let cost = valueDict["cost"] as? Double
            else { return nil }
        self.title = title
        self.cost = cost
    }
    
    func price() -> String {
        return String(format: "$%0.2f", cost)
    }
    
    func paramaterize() -> [String: Any] {
        let dict: [String: Any] = ["title": title,
                                   "cost":cost]
        return dict
    }
}
