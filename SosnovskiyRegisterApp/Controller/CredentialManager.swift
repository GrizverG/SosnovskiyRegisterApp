//
//  CredentialManager.swift
//  SosnovskiyRegisterApp
//
//  Created by Gregory Pinetree on 12.07.2020.
//  Copyright © 2020 Gregory Pinetree. All rights reserved.
//

import Foundation

final class CredentialManager {
    
    private enum Keys {
        static let loginKey = "loginKey"
        static let passwordKey = "passwordKey"
    }
    
    func getLogin() -> String {
        return "Login: \(UserDefaults.standard.string(forKey: Keys.loginKey)!)"
    }
    
    func getPassword() -> String {
        return "Password: \(UserDefaults.standard.string(forKey: Keys.passwordKey)!)"
    }
    
    func hasProfile() -> Bool {
        if let _ = UserDefaults.standard.string(forKey: Keys.loginKey),
            let _ = UserDefaults.standard.string(forKey: Keys.passwordKey) {
            return true
        }
        return false
    }
}

// MARK: - Credential saving delegate
extension CredentialManager: saveCredentialsDelegate {
    func passCredentials(_ login: String, _ password: String) {
        UserDefaults.standard.set(login, forKey: Keys.loginKey)
        UserDefaults.standard.set(password, forKey: Keys.passwordKey)
    }
    
    func removeCredentials() {
        UserDefaults.standard.removeObject(forKey: Keys.loginKey)
        UserDefaults.standard.removeObject(forKey: Keys.passwordKey)
    }
}
