//
//  AnalyticsInteractor.swift
//  ChatKeepcoding
//
//  Created by Eric Risco de la Torre on 02/04/2018.
//  Copyright © 2018 ERISCO. All rights reserved.
//

import Foundation

public class LogInteractor {
    
    var manager: LogManager
    
    public init(manager: LogManager){
        self.manager = manager
    }
    
    public convenience init(){
        self.init(manager: LogDummy())
    }
    
}
