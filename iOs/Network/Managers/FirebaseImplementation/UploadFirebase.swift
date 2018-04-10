//
//  UploadFirebase.swift
//  ChatKeepcoding
//
//  Created by Eric Risco de la Torre on 10/04/2018.
//  Copyright © 2018 ERISCO. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseStorage

public class UploadFirebase: UploadManager {
    
    var discussion: Discussion
    
    public required init(discussion: Discussion) {
        self.discussion = discussion
    }
    
    public func save(name: String, image: UIImage, onSuccess: @escaping (String) -> Void, onError: ErrorClosure?) {
        
        let ref = Storage.storage().reference().child(discussion.uid).child(name)
        
        if let imageData = UIImageJPEGRepresentation(image, 0.3) {
            let metadata = StorageMetadata()
            metadata.contentType = "image/jpeg"
            
            ref.putData(imageData, metadata: metadata, completion: { (metadata, error) in
                if let err = error, let retError = onError {
                    retError(err)
                }
                
                if let m = metadata, let url = m.downloadURL() {
                    onSuccess(url.absoluteString)
                }
                
            })
            
            
        }
        
    }
    
}
