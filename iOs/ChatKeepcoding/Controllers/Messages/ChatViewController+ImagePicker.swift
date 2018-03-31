//
//  ChatViewController+ImagePicker.swift
//  ChatKeepcoding
//
//  Created by Eric Risco de la Torre on 28/03/2018.
//  Copyright © 2018 ERISCO. All rights reserved.
//

import UIKit
import MessageKit

extension ChatViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        dismiss(animated: true, completion: {
            if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
                
                let name = "\(UUID().uuidString).jpg"
                let data = MessageData.photo(pickedImage)
                let message = Message.init(sender: self.currentSender(),
                                           data: data,
                                           type: MessageTypeEnum.image.rawValue,
                                           value: name)
                
                let uploadManager = UploadInteractor.init(manager: UploadDummy()).manager
                uploadManager.save(name: name, image: pickedImage, onSuccess: { url in
                    
                    message.value = url
                    
                    let manager = MessageInteractor.init(manager: MessageDummy.init(discussion: self.actualDiscussion)).manager
                    manager.add(message: message, onSuccess: {
                        self.messages.append(message)
                        self.messagesCollectionView.insertSections([self.messages.count - 1])
                    }, onError: { (error) in
                        print(error)
                    })
                    
                }, onError: { (error) in
                    print(error)
                })
            
                
            }
        })
    }
}
