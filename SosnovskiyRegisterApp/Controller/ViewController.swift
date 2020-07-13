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
    private weak var profileView: ProfileView!
    
    // MARK: - View did load
    override func viewDidLoad() {
        super.viewDidLoad()
        resetView()
    }
}

// MARK: - Reload view delegate
extension ViewController: reloadViewDelegate {
    func resetView() {
        if self.profileView != nil {
            self.profileView.removeFromSuperview()
        }
        var profileView = ProfileView()
        if credentialManager.hasProfile() {
            let login = credentialManager.getLogin()
            let password = credentialManager.getPassword()
            profileView = ProfileView(login, password)
        }
        profileView.reloadDelegate = self
        profileView.credentialsDelegate = credentialManager
        view.addSubview(profileView)
        profileView.pin(superView: view)
        self.profileView = profileView
    }
}

