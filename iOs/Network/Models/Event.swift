//
//  Event.swift
//  ChatKeepcoding
//
//  Created by Eric Risco de la Torre on 02/04/2018.
//  Copyright © 2018 ERISCO. All rights reserved.
//

import Foundation

public class Event {
    
    public var screen: String
    public var type: String
    public var name: String
    public var parameters: NSDictionary?
    
    init(screen: String, type: String, name: String, parameters: NSDictionary?){
        self.screen = screen
        self.type = type
        self.name = name
        self.parameters = parameters
    }
    
    var description: String {
        get {
            return "[\(self.screen)] \(self.type): \(self.name)"
        }
    }
    
}
