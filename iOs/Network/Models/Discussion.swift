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
    var lastMessage: String
    
    init(uid: String, title: String, lastMessage: String){
        self.uid = uid
        self.title = title
        self.lastMessage = lastMessage
    }
    
    convenience init(){
        self.init(uid: "",
                  title: "",
                  lastMessage: "")
    }
    
}
