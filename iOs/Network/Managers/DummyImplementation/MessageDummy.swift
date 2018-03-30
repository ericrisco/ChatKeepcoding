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
    
    public var discussion: Discussion
    
    public required init(discussion: Discussion) {
        self.discussion = discussion
    }
    
    public func list(onSuccess: @escaping ([Message]) -> Void, onError: ErrorClosure?) {
        
        let john = Sender.init(id: "0", displayName: "John McClane")
        let hans = Sender.init(id: "1", displayName: "Hans Gruber")
        
        let value1 = "Yippie-Ki-Yay, Motherfucker!"
        let d1 = MessageData.text(value1)
        let m1 = Message.init(sender: john, data: d1, type: MessageTypeEnum.text.rawValue, value: value1)
        
        let value2 = "Now I have a machine gun! HO! HO! HO!"
        let d2 = MessageData.text(value2)
        let m2 = Message.init(sender: hans, data: d2, type: MessageTypeEnum.text.rawValue, value: value2)
        
        let value3 = "diehard.jpg"
        let d3 = MessageData.photo(UIImage(named: "diehard.jpg")!)
        let m3 = Message.init(sender: john, data: d3, type: MessageTypeEnum.image.rawValue, value: value3)
        
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

