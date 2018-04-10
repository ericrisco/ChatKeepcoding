//
//  Message+Firebase.swift
//  ChatKeepcoding
//
//  Created by Eric Risco de la Torre on 10/04/2018.
//  Copyright © 2018 ERISCO. All rights reserved.
//

import Foundation
import MessageKit
import Firebase
import FirebaseDatabase

extension Message {
    
    public class func mapper(snapshot: DataSnapshot) -> Message? {
        
        guard let json = snapshot.value as? [String: Any] else {
            return nil
        }
        
        let messageId = json["messageId"] as? String ?? ""
        
        let dateString = json["sentDate"] as? String ?? ""
        let sentDate = Date.fromStringToDate(input: dateString, format: "yyyy-MM-dd HH:mm:ss")
        
        let value = json["value"] as? String ?? ""
        let type = json["type"] as? String ?? ""
        
        let senderId = json["senderId"] as? String ?? ""
        let displayName = json["displayName"] as? String ?? ""
        
        let messageData: MessageData
        
        switch type {
        case MessageTypeEnum.text.rawValue:
            messageData = MessageData.text(value)
            break
        case "image":
            let placeholder = UIImage.init(named: "placeholder")
            messageData = MessageData.photo(placeholder!)
            break
        default:
            messageData = MessageData.text(value)
        }
        
        let sender = Sender.init(id: senderId, displayName: displayName)
        let message = Message.init(sender: sender, messageId: messageId, sentDate: sentDate, data: messageData, type: type, value: value)
        
        return message
        
    }
    
    public class func toDict(message: Message) -> [String: String] {
        
        let dateString = Date.fromDateToString(date: Date(), format: "yyyy-MM-dd HH:mm:ss")
        
        var dict = [String: String]()
        dict["messageId"] = message.messageId
        dict["senderId"] = message.sender.id
        dict["displayName"] = message.sender.displayName
        dict["sentDate"] = dateString
        dict["type"] = message.type
        dict["value"] = message.value
        return dict
        
    }
    
}
