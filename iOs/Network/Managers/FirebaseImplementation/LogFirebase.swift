//
//  LogFirebase.swift
//  ChatKeepcoding
//
//  Created by Eric Risco de la Torre on 12/04/2018.
//  Copyright © 2018 ERISCO. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAnalytics

public class LogFirebase: LogManager {
    
    public func log(event: Event){
        
        Analytics.setScreenName(event.screen, screenClass: event.type)
        Analytics.logEvent(event.name, parameters: event.parameters as? [String: Any])
        
    }
    
}

