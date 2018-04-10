//
//  ChatViewController+DataSource.swift
//  ChatKeepcoding
//
//  Created by Eric Risco de la Torre on 28/03/2018.
//  Copyright © 2018 ERISCO. All rights reserved.
//

import Foundation
import MessageKit
import Kingfisher

extension ChatViewController: MessagesDataSource {
    
    func fetchMessages() {
        
        let manager = MessageInteractor.init(manager: MessageFirebase.init(discussion: self.actualDiscussion)).manager
        
        manager.list(onSuccess: { (messages) in
            self.messages = messages
            self.downloadImages(array: messages)
            self.messagesCollectionView.reloadData()
            self.messagesCollectionView.scrollToBottom()
        }) { (error) in
            print(error)
        }
        
    }
    
    func downloadImages(array: [Message]){
        for (index, message) in array.enumerated(){
            switch message.data {
            case .photo:
                let image = UIImageView()
                let url = URL.init(string: message.value)!
                
                image.kf.setImage(with: url, placeholder: nil, options: nil, progressBlock: nil, completionHandler: { (image, _ , _ , _ ) in
                    if let img = image {
                        message.data = MessageData.photo(img)
                        self.messages[index] = message
                        self.messagesCollectionView.reloadData()
                    }
                })
                
                break
            default: break
            }
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
