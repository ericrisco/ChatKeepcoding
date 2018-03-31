//
//  UserManager.swift
//  ChatKeepcoding
//
//  Created by Eric Risco de la Torre on 28/03/2018.
//  Copyright © 2018 ERISCO. All rights reserved.
//

import Foundation

public protocol UserManager {
    
    func register(user: User, onSuccess: @escaping (User) -> Void, onError: ErrorClosure?)
    func login(user: User, onSuccess: @escaping (User) -> Void, onError: ErrorClosure?)
    func recoverPassword(user: User, onSuccess: @escaping (User) -> Void, onError: ErrorClosure?)
    func isLogged(onSuccess: @escaping (User?) -> Void, onError: ErrorClosure?)
    func logout(onSuccess: @escaping () -> Void, onError: ErrorClosure?)
    
}
