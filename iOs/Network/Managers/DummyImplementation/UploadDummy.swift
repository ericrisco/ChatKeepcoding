//
//  UploadDummy.swift
//  ChatKeepcoding
//
//  Created by Eric Risco de la Torre on 29/03/2018.
//  Copyright © 2018 ERISCO. All rights reserved.
//

import Foundation
import UIKit

public class UploadDummy: UploadManager {
    
    public func save(name: String, image: UIImage, onSuccess: @escaping (_ url: String) -> Void, onError: ErrorClosure?) {
        
        onSuccess("aaa.jpg")
        
    }
    
}
