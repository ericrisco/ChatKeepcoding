//
//  ChatViewController+InputBar.swift
//  ChatKeepcoding
//
//  Created by Eric Risco de la Torre on 28/03/2018.
//  Copyright © 2018 ERISCO. All rights reserved.
//

import Foundation
import MessageKit

extension ChatViewController: MessageInputBarDelegate {
    
    func messageInputBar(_ inputBar: MessageInputBar, didPressSendButtonWith text: String) {
        
        for component in inputBar.inputTextView.components {
            if let text = component as? String {
                let data = MessageData.text(text)
                let message = Message.init(sender: currentSender(), data: data, type: MessageTypeEnum.text.rawValue, value: text)
                
                let manager = MessageInteractor.init(manager: MessageDummy.init(discussion: self.actualDiscussion)).manager
                
                manager.add(message: message, onSuccess: {
                    self.messages.append(message)
                    self.messagesCollectionView.insertSections([self.messages.count - 1])
                }, onError: { (error) in
                    print(error)
                })
                
            }
        }
        
        inputBar.inputTextView.text = String()
        messagesCollectionView.scrollToBottom()
    }
    
}
