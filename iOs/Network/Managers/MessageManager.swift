//
//  MessageManager.swift
//  ChatKeepcoding
//
//  Created by Eric Risco de la Torre on 28/03/2018.
//  Copyright © 2018 ERISCO. All rights reserved.
//

import Foundation

public protocol MessageManager {
    
    var discussion: Discussion { get set }
    
    init(discussion: Discussion)
    func list(onSuccess: @escaping ([Message]) -> Void, onError: ErrorClosure?)
    func add(message: Message, onSuccess: @escaping () -> Void, onError: ErrorClosure?)
    
}

