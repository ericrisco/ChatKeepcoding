//
//  MessageFirebase.swift
//  ChatKeepcoding
//
//  Created by Eric Risco de la Torre on 10/04/2018.
//  Copyright © 2018 ERISCO. All rights reserved.
//

import Foundation
import MessageKit
import Firebase
import FirebaseDatabase

public class MessageFirebase: MessageManager {
    
    public var discussion: Discussion
    var ref: DatabaseReference
    
    public required init(discussion: Discussion) {
        self.discussion = discussion
        self.ref = Database.database().reference().child("messages").child(self.discussion.uid)
    }
    
    public func list(onSuccess: @escaping ([Message]) -> Void, onError: ErrorClosure?) {
        
        self.ref.observe(.value, with: { (snapshot) in
            
            /*
            let messages = snapshot.children
                .flatMap({ Message.mapper(snapshot: $0 as! DataSnapshot ) })
                .sorted(by: { $0.sentDate < $1.sentDate })
            */
            
            var messages = [Message]()
            
            for child in snapshot.children {
                let message = Message.mapper(snapshot: child as! DataSnapshot)
                messages.append(message!)
            }
            
            messages = messages.sorted(by: { (m1, m2) -> Bool in
                return m1.sentDate < m2.sentDate
            })
            
            
            onSuccess(messages)
            
        }) { (error) in
            if let retError = onError {
                retError(error)
            }
        }
        
        
    }
    
    public func add(message: Message, onSuccess: @escaping () -> Void, onError: ErrorClosure?) {
        
        let child = Message.toDict(message: message)
        
        ref.child(message.messageId).updateChildValues(child) { (error, _ ) in
            if let err = error, let retError = onError {
                retError(err)
            }
            onSuccess()
        }
        
    }
    
}
