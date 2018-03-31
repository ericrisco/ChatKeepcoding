//
//  User.swift
//  ChatKeepcoding
//
//  Created by Eric Risco de la Torre on 28/03/2018.
//  Copyright © 2018 ERISCO. All rights reserved.
//

import Foundation
import MessageKit

public class User {
    
    public var email: String
    public var password: String?
    public var sender: Sender
    
    init(id: String, email: String, password: String?){
        self.sender = Sender.init(id: id, displayName: email)
        self.email = email
        self.password = password
    }
    
}
