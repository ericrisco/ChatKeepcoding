//
//  AnalyticDummy.swift
//  ChatKeepcoding
//
//  Created by Eric Risco de la Torre on 02/04/2018.
//  Copyright © 2018 ERISCO. All rights reserved.
//

import Foundation

public class LogDummy: LogManager {
    
    public func log(event: Event) {
        
        print(event.description)
        
    }
    
}
