//
//  Discussion.swift
//  ChatKeepcoding
//
//  Created by Eric Risco de la Torre on 21/03/2018.
//  Copyright © 2018 ERISCO. All rights reserved.
//

import Foundation

public class Discussion {
    
    var uid: String
    var title: String
    var lastMessageDate: Date
    var lastMessageText: String
    var lastMessageUser: String
    
    init(uid: String, title: String, lastMessageDate: Date, lastMessageText: String, lastMessageUser: String){
        self.uid = uid
        self.title = title
        self.lastMessageDate = lastMessageDate
        self.lastMessageText = lastMessageText
        self.lastMessageUser = lastMessageUser
    }
    
    convenience init(){
        self.init(uid: "",
                  title: "",
                  lastMessageDate: Date(),
                  lastMessageText: "",
                  lastMessageUser: "")
    }
    
}
