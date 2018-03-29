//
//  MessagesViewController.swift
//  ChatKeepcoding
//
//  Created by Eric Risco de la Torre on 22/03/2018.
//  Copyright © 2018 ERISCO. All rights reserved.
//

import UIKit
import MessageKit

class ChatViewController: MessagesViewController {

    // MARK: - Attributes
    var user: User!
    var actualDiscussion: Discussion!
    var messages: [MessageType] = []
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        
        guard let _ = actualDiscussion else {
            return
        }
        
        guard let _ = user else {
            return
        }
        
        super.viewDidLoad()
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        messageInputBar.delegate = self
        self.setStyle()
        self.fetchMessages()
    }

}
