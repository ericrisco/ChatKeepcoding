//
//  LoginViewController.swift
//  ChatKeepcoding
//
//  Created by Eric Risco de la Torre on 28/03/2018.
//  Copyright © 2018 ERISCO. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: - Attributes
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let manager = UserInteractor.init(manager: UserDummy()).manager
        manager.isLogged(onSuccess: { (user) in
            if let u = user {
                self.navigateToDiscussions(user: u)
            }
        }, onError: nil)
        
        let event = Event.init(screen: "LoginViewController", type: "action", name: "APP_DID_LOAD", parameters: nil)
        let logManager = LogInteractor.init().manager
        logManager.log(event: event)
        
    }
    
    // MARK: - Navigation
    
    @IBAction func loginClicked(_ sender: Any) {
        
        guard let email = emailField.text else {
            return
        }
        
        guard let password = passwordField.text else{
            return
        }
        
        let user = User.init(id: "", email: email, password: password)
        
        let manager = UserInteractor.init(manager: UserFirebase()).manager
        manager.login(user: user, onSuccess: { (user) in
            self.navigateToDiscussions(user: user)
        }) { (error) in
            self.showAlert(title: "Error", message: error.localizedDescription)
        }
        
    }
    
    @IBAction func registerClicked(_ sender: Any) {
        
        guard let email = emailField.text else {
            return
        }
        
        guard let password = passwordField.text else{
            return
        }
        
        let user = User.init(id: "", email: email, password: password)
        
        let manager = UserInteractor.init(manager: UserFirebase()).manager
        manager.register(user: user, onSuccess: { (user) in
            self.navigateToDiscussions(user: user)
        }) { (error) in
            self.showAlert(title: "Error", message: error.localizedDescription)
        }
        
    }
    
    @IBAction func recoverClicked(_ sender: Any) {
        
        guard let email = emailField.text else {
            return
        }
        
        let user = User.init(id: "", email: email, password: nil)
        
        let manager = UserInteractor.init(manager: UserFirebase()).manager
        manager.recoverPassword(user: user, onSuccess: { (user) in
            self.showAlert(title: "Password", message: "Password recovered")
        }) { (error) in
            self.showAlert(title: "Error", message: error.localizedDescription)
        }
        
    }
    
    func navigateToDiscussions(user: User){
        
        let event = Event.init(screen: "LoginViewController", type: "action", name: "LOGIN", parameters: ["Email": user.email as NSObject])
        let manager = LogInteractor.init().manager
        manager.log(event: event)
        
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DiscussionViewController") as? DiscussionViewController {
            if let navigator = navigationController {
                viewController.user = user
                navigator.pushViewController(viewController, animated: true)
            }
        }
    }
    
    func showAlert(title: String, message: String){
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
}
