//
//  ViewController.swift
//  HW 2.3 GnilitskiyAA
//
//  Created by Александр on 05.04.2022.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var userName: UITextField!
    @IBOutlet var userPassword: UITextField!
    
    @IBOutlet var login: UIButton!
    
    @IBOutlet var forgotPassword: UIButton!
    @IBOutlet var forgotName: UIButton!
    
    let passwordUser = "1111"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userPassword.delegate = self
    }
    
    @IBAction func bottomForgotName() {
        alert(mainMessage: "Look in your passport", secondaryMessage: "")
    }
    
    @IBAction func bottomForgotPassword() {
        alert(mainMessage: "Steer", secondaryMessage: passwordUser)
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard segue.source is EntryViewController else { return }
        userPassword.text = .none
        userName.text = .none
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if userName.text?.isEmpty == false && userPassword.text == passwordUser {
            guard let handOverName = segue.destination as? EntryViewController else { return }
            handOverName.entryNameReception = userName.text
            view.endEditing(true)
        } else {
            alert(mainMessage: "wrong login or password", secondaryMessage: "The password is really easy")
            userPassword.text = .none
        }
    }
    
    
    // MARK: - Клавиатура
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first != nil {
            view.endEditing(true)
        }
        super .touchesBegan(touches, with: event)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userPassword.becomeFirstResponder()
        
        return true
    }

    private func alert (mainMessage: String, secondaryMessage: String) {
        let alertName = UIAlertController(title: mainMessage, message: secondaryMessage, preferredStyle: .alert)
        let alertOk = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertName.addAction(alertOk)
        present(alertName, animated: true, completion: nil)
    }
}





