//
//  ViewController.swift
//  SosnovskiyRegisterApp
//
//  Created by Gregory Pinetree on 12.07.2020.
//  Copyright © 2020 Gregory Pinetree. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties
    private var credentialManager = CredentialManager()
    private var profileView = ProfileView()
    
    // MARK: - View did load
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(profileView)
        profileView.pin(superView: view)
        profileView.reloadDelegate = self
        profileView.credentialsDelegate = credentialManager
        resetView()
    }
}

// MARK: - Reload view delegate
extension ViewController: ReloadViewDelegate {
    func resetView() {
        if credentialManager.hasProfile() {
            let login = credentialManager.getLogin()
            let password = credentialManager.getPassword()
            profileView.configure(login, password)
        } else {
            profileView.configure(nil, nil)
        }
    }
}

