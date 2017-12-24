//
//  FIRMessagingService.swift
//  For Sale
//
//  Created by Ben Aaron on 12-24-17.
//  Copyright © 2017 Ben Aaron. All rights reserved.
//

import Foundation
import FirebaseMessaging

enum SubscriptionTopic: String {
     case newProducts = "newProducts"
}

class FIRMessagingService{
    private init() {}
    static let shared = FIRMessagingService()
    let messasging = Messaging.messaging()
    
    func subscribe(to topic: SubscriptionTopic) {
        messasging.subscribe(toTopic: topic.rawValue)
    }
    
    func unsubscribe(from topic: SubscriptionTopic) {
        messasging.unsubscribe(fromTopic: topic.rawValue)
    }
}
