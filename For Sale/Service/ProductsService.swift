//
//  ProductsService.swift
//  For Sale
//
//  Created by Ben Aaron on 12-23-17.
//  Copyright © 2017 Ben Aaron. All rights reserved.
//

import Foundation

protocol ProductsServiceDelegate{
    func didChange(products: [Product])
}

class ProductsService {
    private init() {}
    static let shared = ProductsService()
    var delegate: ProductsServiceDelegate?
    
    
    func observeProducts() {
        FIRDatabaseService.shared.observe(.products) { (snapshot) in
            guard let productsSnapshot = ProductsSnapshot(snapshot: snapshot) else { return }
            self.delegate?.didChange(products: productsSnapshot.products)
        }
    }
    
    func postProduct(product: Product) {
        FIRDatabaseService.shared.post(paramaters: product.paramaterize(), to: .products)
    }
}
