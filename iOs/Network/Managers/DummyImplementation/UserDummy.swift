//
//  UserDummy.swift
//  ChatKeepcoding
//
//  Created by Eric Risco de la Torre on 28/03/2018.
//  Copyright © 2018 ERISCO. All rights reserved.
//

import Foundation
import MessageKit

public class UserDummy: UserManager {
    
    
    public func register(user: User, onSuccess: @escaping (User) -> Void, onError: ErrorClosure?) {
        
        user.sender = Sender.init(id: "0", displayName: "John McClane")
        onSuccess(user)
        
    }
    
    public func login(user: User, onSuccess: @escaping (User) -> Void, onError: ErrorClosure?) {
        
        user.sender = Sender.init(id: "0", displayName: "John McClane")
        onSuccess(user)
        
    }
    
    public func recoverPassword(user: User, onSuccess: @escaping (User) -> Void, onError: ErrorClosure?) {
        
        user.sender = Sender.init(id: "0", displayName: "John McClane")
        onSuccess(user)
        
    }
    
    public func isLogged(onSuccess: @escaping (User?) -> Void, onError: ErrorClosure?) {
        
        let user = User.init(id: "0", email: "aaa@aaa.com", password: nil)
        onSuccess(nil)
        
    }
    
    public func logout(onSuccess: @escaping () -> Void, onError: ErrorClosure?) {
        
        let user = User.init(id: "0", email: "aaa@aaa.com", password: nil)
        onSuccess()
        
    }
    

}
