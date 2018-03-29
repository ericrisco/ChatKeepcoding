//
//  MessageDummy.swift
//  ChatKeepcoding
//
//  Created by Eric Risco de la Torre on 28/03/2018.
//  Copyright © 2018 ERISCO. All rights reserved.
//

import Foundation
import MessageKit

public class MessageDummy: MessageManager {
    
    public func list(discussionId: String, onSuccess: @escaping ([Message]) -> Void, onError: ErrorClosure?) {
        
        let john = Sender.init(id: "0", displayName: "John McClane")
        let hans = Sender.init(id: "1", displayName: "Hans Gruber")
        
        let d1 = MessageData.text("Yippie-Ki-Yay, Motherfucker!")
        let m1 = Message.init(sender: john, data: d1)
        
        let d2 = MessageData.text("Now I have a machine gun.")
        let m2 = Message.init(sender: hans, data: d2)
        
        let d3 = MessageData.photo(UIImage(named: "diehard")!)
        let m3 = Message.init(sender: john, data: d3)
        
        var messages: [Message] = [Message]()
        
        messages.append(m1)
        messages.append(m3)
        messages.append(m2)
        
        onSuccess(messages)
        
    }
    
    public func add(message: Message, onSuccess: @escaping () -> Void, onError: ErrorClosure?) {
        
        onSuccess()
        
    }
    
}
