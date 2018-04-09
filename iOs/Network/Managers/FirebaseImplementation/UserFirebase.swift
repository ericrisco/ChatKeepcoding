//
//  UserFirebase.swift
//  ChatKeepcoding
//
//  Created by Eric Risco de la Torre on 09/04/2018.
//  Copyright © 2018 ERISCO. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth
import MessageKit

public class UserFirebase: UserManager {
    
    public func register(user: User, onSuccess: @escaping (User) -> Void, onError: ErrorClosure?) {
        
        Auth.auth().createUser(withEmail: user.email, password: user.password!) { (user, error) in
            
            if let err = error, let retError = onError {
                retError(err)
            }
            
            if let u = user {
                let ownUser = User.init(id: u.uid, email: u.email!, password: nil)
                onSuccess(ownUser)
            }
            
        }
        
        
    }
    
    public func login(user: User, onSuccess: @escaping (User) -> Void, onError: ErrorClosure?) {
        
        Auth.auth().signIn(withEmail: user.email, password: user.password!) { (user, error) in
            
            if let err = error, let retError = onError {
                retError(err)
            }
            
            if let u = user {
                let ownUser = User.init(id: u.uid, email: u.email!, password: nil)
                onSuccess(ownUser)
            }
            
        }
        
    }
    
    public func recoverPassword(user: User, onSuccess: @escaping (User) -> Void, onError: ErrorClosure?) {
        
        Auth.auth().sendPasswordReset(withEmail: user.email) { (error) in
            
            if let err = error, let retError = onError {
                retError(err)
            }
            
            onSuccess(user)
            
        }
        
    }
    
    public func isLogged(onSuccess: @escaping (User?) -> Void, onError: ErrorClosure?) {
        
        if let user = Auth.auth().currentUser {
            let user = User.init(id: user.uid, email: user.email!, password: nil)
            onSuccess(user)
        }
        
        onSuccess(nil)
        
    }
    
    public func logout(onSuccess: @escaping () -> Void, onError: ErrorClosure?) {
        
        do {
            try Auth.auth().signOut()
            onSuccess()
        } catch let error as NSError {
            print(error.localizedDescription)
            if let retError = onError {
                retError(error)
            }
        }
        
    }
    
}
