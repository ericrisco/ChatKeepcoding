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
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let email = emailField.text else {
            return
        }
        
        guard let password = passwordField.text else{
            return
        }
        
        if let identifier = segue.identifier {
            switch identifier {
            case "loginSegue":
                loginClicked(email: email, password: password, segue: segue)
                break
            case "registerSegue":
                registerClicked(email: email, password: password, segue: segue)
                break
            default:
                break
            }
        }
    }
    
    func loginClicked(email: String, password: String, segue: UIStoryboardSegue) {
        
        guard let email = emailField.text else {
            return
        }
        
        guard let password = passwordField.text else{
            return
        }
        
        let user = User.init(id: "", email: email, password: password)
        
        let manager = UserInteractor.init(manager: UserDummy()).manager
        
        manager.login(user: user, onSuccess: { (user) in
            self.navigateToDiscussions(user: user, segue: segue)
        }) { (error) in
            print(error)
            let alertController = UIAlertController(title: "Login Error",
                                                    message: "Please enter a valid user name and password",
                                                    preferredStyle: .alert)
            let retryAction = UIAlertAction(title: "Retry", style: .default, handler: nil)
            alertController.addAction(retryAction)
        }
        
    }
    
    func registerClicked(email: String, password: String, segue: UIStoryboardSegue) {
        
        guard let email = emailField.text else {
            return
        }
        
        guard let password = passwordField.text else{
            return
        }
        
        let user = User.init(id: "", email: email, password: password)
        
        let manager = UserInteractor.init(manager: UserDummy()).manager
        
        manager.register(user: user, onSuccess: { (user) in 
            self.navigateToDiscussions(user: user, segue: segue)
        }) { (error) in
            print(error)
            let alertController = UIAlertController(title: "Register Error",
                                                    message: "Please enter a valid user name and password",
                                                    preferredStyle: .alert)
            let retryAction = UIAlertAction(title: "Retry", style: .default, handler: nil)
            alertController.addAction(retryAction)
        }
        
    }
    
    func navigateToDiscussions(user: User, segue: UIStoryboardSegue){
        let vc = segue.destination as! DiscussionViewController
        vc.user = user
    }
}
