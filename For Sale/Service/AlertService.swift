//
//  AlertService.swift
//  For Sale
//
//  Created by Ben Aaron on 12-19-17.
//  Copyright © 2017 Ben Aaron. All rights reserved.
//

import UIKit

class AlertService {
    
    private init() {}
    
    static func addProductAlert(in vc: UIViewController, completion: @escaping (Product) -> Void) {
        let alert = UIAlertController(title: "New product", message: "What's for sale?", preferredStyle: .alert)
        alert.addTextField { (titleTF) in
            titleTF.placeholder = "Title"
        }
        alert.addTextField { (priceTF) in
            priceTF.placeholder = "Twenty Dollas?"
            priceTF.keyboardType = .numberPad
        }
        let send = UIAlertAction(title: "send", style: .default) { (_) in
            guard let title = alert.textFields?.first?.text,
                let price = alert.textFields?.last?.text,
                let cost = Double(price)
                else {return}
            
            let product = Product(title: title, cost: cost)
            completion(product)
        }
        alert.addAction(send)
        vc.present(alert, animated: true)
    }
    
    static func subscribeAlert(in vc:UIViewController) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let subscribe = UIAlertAction(title: "Subscribe", style: .default) { (_) in
            FIRMessagingService.shared.subscribe(to: .newProducts)
        }
        let unsubscribe = UIAlertAction(title:"Unsubscribe", style: .destructive) { (_) in
            FIRMessagingService.shared.unsubscribe(from: .newProducts)
        }
        alert.addAction(subscribe)
        alert.addAction(unsubscribe)
        vc.present(alert, animated: true)
        
    }
    
}
