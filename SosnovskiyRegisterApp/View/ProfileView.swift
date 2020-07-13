//
//  profileView.swift
//  SosnovskiyRegisterApp
//
//  Created by Gregory Pinetree on 12.07.2020.
//  Copyright © 2020 Gregory Pinetree. All rights reserved.
//

import UIKit
import Foundation

protocol saveCredentialsDelegate: class {
    func passCredentials(_ login: String, _ password: String)
    func removeCredentials()
}

protocol reloadViewDelegate: class {
    func resetView()
}

final class ProfileView: UIView {
    
    // MARK: - Constants
    private enum Constants {
        static let surraunding = 70
        static let fieldHight = 70
        static let distance = 90
    }
    
    // MARK: Delegate
    weak var credentialsDelegate: saveCredentialsDelegate?
    weak var reloadDelegate: reloadViewDelegate?
    
    //
    // MARK: - Properties
    //
    private weak var loginLabel: UILabel!
    private weak var passwordLabel: UILabel!

    private weak var loginTextField: UITextField!
    private weak var passwordTextField: UITextField!
    
    private weak var signInButton: UIButton!
    private weak var signOutButton: UIButton!
    
    private var numberOfElements = 0
    private var Distance: Int {
        numberOfElements += 1
        return Constants.distance * numberOfElements
    }
    
    // MARK: - Registration view init
    init() {
        super.init(frame: .zero)
        backgroundColor = .darkGray
        setupLoginLabel()
        setupLoginTextField()
        setupPasswordLabel()
        setupPasswordTextField()
        setupSignInButton()
    }
    
    // MARK: - Profile view init
    init(_ first: String, _ second: String) {
        super.init(frame: .zero)
        backgroundColor = .darkGray
        setupLoginLabel()
        setupPasswordLabel()
        loginLabel.textAlignment = .center
        passwordLabel.textAlignment = .center
        loginLabel.text = first
        passwordLabel.text = second
        numberOfElements = 4
        setupSignOutButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Login label
    private func setupLoginLabel() {
        let loginLabel = UILabel()
        
        addSubview(loginLabel)
        loginLabel.textColor = .white
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        loginLabel.addToTop(anchor: topAnchor, multiplier: Distance)
        loginLabel.addToLeft(anchor: leadingAnchor, multiplier: Constants.surraunding)
        loginLabel.addToRight(anchor: trailingAnchor, multiplier: -Constants.surraunding)
        loginLabel.height(Constants.fieldHight)
        loginLabel.text = "Login:"
        loginLabel.font = UIFont.boldSystemFont(ofSize: 22)
        loginLabel.numberOfLines = 2
        self.loginLabel = loginLabel
    }
    
    // MARK: - Login text field
    private func setupLoginTextField() {
        let loginTextField = UITextField()
        
        addSubview(loginTextField)
        loginTextField.placeholder = "Your login here"
        loginTextField.font = UIFont.systemFont(ofSize: 15)
        loginTextField.borderStyle = .roundedRect
        loginTextField.autocorrectionType = UITextAutocorrectionType.no
        loginTextField.keyboardType = UIKeyboardType.default
        loginTextField.returnKeyType = UIReturnKeyType.done
        loginTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        loginTextField.contentVerticalAlignment = .center
        loginTextField.delegate = self
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        loginTextField.addToTop(anchor: topAnchor, multiplier: Distance)
        loginTextField.addToLeft(anchor: leadingAnchor, multiplier: Constants.surraunding)
        loginTextField.addToRight(anchor: trailingAnchor, multiplier: -Constants.surraunding)
        loginTextField.height(Constants.fieldHight)
        self.loginTextField = loginTextField
    }
    
    // MARK: - Password label
    private func setupPasswordLabel() {
        let passwordLabel = UILabel()
        
        addSubview(passwordLabel)
        passwordLabel.textColor = .white
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.addToTop(anchor: topAnchor, multiplier: Distance)
        passwordLabel.addToLeft(anchor: leadingAnchor, multiplier: Constants.surraunding)
        passwordLabel.addToRight(anchor: trailingAnchor, multiplier: -Constants.surraunding)
        passwordLabel.height(Constants.fieldHight)
        passwordLabel.text = "Password:"
        passwordLabel.font = UIFont.boldSystemFont(ofSize: 22)
        passwordLabel.numberOfLines = 2
        self.passwordLabel = passwordLabel
    }
    // MARK: - Password text field
    private func setupPasswordTextField() {
        let pwTextField = UITextField()
        
        addSubview(pwTextField)
        pwTextField.placeholder = "Your password here"
        pwTextField.font = UIFont.systemFont(ofSize: 15)
        pwTextField.borderStyle = UITextField.BorderStyle.roundedRect
        pwTextField.autocorrectionType = UITextAutocorrectionType.no
        pwTextField.keyboardType = UIKeyboardType.default
        pwTextField.returnKeyType = UIReturnKeyType.done
        pwTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        pwTextField.contentVerticalAlignment = .center
        pwTextField.delegate = self
        pwTextField.translatesAutoresizingMaskIntoConstraints = false
        pwTextField.addToTop(anchor: topAnchor, multiplier: Distance)
        pwTextField.addToLeft(anchor: leadingAnchor, multiplier: Constants.surraunding)
        pwTextField.addToRight(anchor: trailingAnchor, multiplier: -Constants.surraunding)
        pwTextField.height(Constants.fieldHight)
        self.passwordTextField = pwTextField
    }
    
    // MARK: - Sign in button
    private func setupSignInButton() {
        let signInButton = UIButton()
        
        addSubview(signInButton)
        signInButton.setTitle("Done", for: .normal)
        signInButton.backgroundColor = .orange
        signInButton.layer.cornerRadius = 35
        signInButton.clipsToBounds = true
        signInButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 35)
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.addTarget(self, action: #selector(signIn), for: .touchUpInside)
        signInButton.addToBottom(anchor: bottomAnchor, multiplier: -Constants.distance)
        signInButton.addToLeft(anchor: leadingAnchor, multiplier: Constants.surraunding)
        signInButton.addToRight(anchor: trailingAnchor, multiplier: -Constants.surraunding)
        signInButton.height(Constants.fieldHight)
        self.signInButton = signInButton
    }
    
    // MARK: Sign in selector
    @objc func signIn(sender: UIButton!) {
        if let login = loginTextField.text, let password = passwordTextField.text {
            if !login.isEmpty && !password.isEmpty {
                credentialsDelegate?.passCredentials(login, password)
                reloadDelegate?.resetView()
            }
        }
    }
    
    // MARK: - Sign out button
    private func setupSignOutButton() {
        let signOutButton = UIButton()
        
        addSubview(signOutButton)
        signOutButton.setTitle("Sign out", for: .normal)
        signOutButton.backgroundColor = .orange
        signOutButton.layer.cornerRadius = 35
        signOutButton.clipsToBounds = true
        signOutButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 35)
        signOutButton.translatesAutoresizingMaskIntoConstraints = false
        signOutButton.addTarget(self, action: #selector(signOut), for: .touchUpInside)
        signOutButton.addToBottom(anchor: bottomAnchor, multiplier: -Constants.distance)
        signOutButton.addToLeft(anchor: leadingAnchor, multiplier: Constants.surraunding)
        signOutButton.addToRight(anchor: trailingAnchor, multiplier: -Constants.surraunding)
        signOutButton.height(Constants.fieldHight)
        self.signOutButton = signOutButton
    }
    
    // MARK: - Sign out selector
    @objc func signOut(sender: UIButton!) {
        credentialsDelegate?.removeCredentials()
        reloadDelegate?.resetView()
    }
    
    
    // MARK: - Touches began
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        endEditing(true)
    }
}

// MARK: - UITextFieldDelegate
extension ProfileView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEditing(true)
        return false
    }
}

