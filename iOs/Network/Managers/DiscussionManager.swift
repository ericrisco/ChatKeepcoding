//
//  DiscussionManager.swift
//  ChatKeepcoding
//
//  Created by Eric Risco de la Torre on 21/03/2018.
//  Copyright © 2018 ERISCO. All rights reserved.
//

import Foundation

public protocol DiscussionManager {
    
    func list(onSuccess: @escaping ([Discussion]) -> Void, onError: ErrorClosure?)
    
}
