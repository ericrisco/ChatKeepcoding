//
//  ChatViewController+DataSource.swift
//  ChatKeepcoding
//
//  Created by Eric Risco de la Torre on 28/03/2018.
//  Copyright © 2018 ERISCO. All rights reserved.
//

import Foundation
import MessageKit

extension ChatViewController: MessagesDataSource {
    
    func fetchMessages() {
        
        let manager = MessageInteractor.init(manager: MessageDummy.init(discussion: self.actualDiscussion)).manager
        
        manager.list(onSuccess: { (messages) in
            self.messages = messages
            self.messagesCollectionView.reloadData()
            self.messagesCollectionView.scrollToBottom()
        }) { (error) in
            print(error)
        }
        
    }
    
    func currentSender() -> Sender {
        return user.sender
    }
    
    func numberOfMessages(in messagesCollectionView: MessagesCollectionView) -> Int {
        return self.messages.count
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return self.messages[indexPath.section]
    }
}
