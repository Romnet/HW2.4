//
//  ViewController.swift
//  HW2.4
//
//  Created by Роман on 08.02.2020.
//  Copyright © 2020 Romnet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
        
    }

    @IBAction func forgotUsernameButtonPressed() {
        let username = User.getUsers()[0].username
        showAlert(with: "Your username is", and: username)
    }
    
    @IBAction func forgotPasswordButtonPressed() {
        let password = User.getUsers()[0].password
        showAlert(with: "Your password is", and: password)
    }
}

// MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField.tag {
        case 0:
            passwordTextField.becomeFirstResponder()
        case 1:
            if shouldPerformSegue(withIdentifier: "LoginSegue", sender: nil) {
                performSegue(withIdentifier: "LoginSegue", sender: nil)
            }
        default: break
        }
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}

extension ViewController {
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if view.frame.origin.y == 0 {
                view.frame.origin.y -= keyboardSize.height / 2
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if view.frame.origin.y != 0 {
            view.frame.origin.y = 0
        }
    }
    
    
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    private func isLoginSuccessful(login: String, password: String) -> Bool {
        let users = User.getUsers()
        for user in users {
            if user.username == login && user.password == password {
                return true
            }
        }
        return false
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarController = segue.destination as! UITabBarController
        let profileVC = tabBarController.viewControllers?[0] as! ProfileController
        let aboutMeVC = tabBarController.viewControllers?[1] as! AboutMeController
        
        guard let usernameText = usernameTextField.text else { return }
        guard let user = User.getUserBy(username: usernameText) else { return }
        
        profileVC.user = user
        aboutMeVC.user = user
        
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard let usernameText = usernameTextField.text else { return false }
        guard let passwordText = passwordTextField.text else { return false }
        
        if !isLoginSuccessful(login: usernameText, password: passwordText) {
            showAlert(with: "Error", and: "Incorrect username of password")
            return false
        } else {
            return true
        }
    }
}
