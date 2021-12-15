//
//  OnboardingVC.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 15/12/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit
import AuthenticationServices

class OnboardingVC: UIViewController {
    var presentor: OnboardingViewToPresenterProtocol?
    public var delegate: OnboardingDelegate!
    private let signInButton = ASAuthorizationAppleIDButton()
        .configure { v in
            v.heightAnchor.constraint(equalToConstant: 50).isActive = true
            v.widthAnchor.constraint(equalToConstant: 315).isActive = true
            v.translatesAutoresizingMaskIntoConstraints = false
            v.addTarget(self, action: #selector(appleSignInTapped), for: .touchUpInside)
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = ""
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        setupViews()
    }
    
    @objc func appleSignInTapped() {
        presentor?.appleSignIn(from: self)
    }
    
}

extension OnboardingVC: OnboardingPresenterToViewProtocol {
    func didSuccessLogin(user: User) {
        presentor?.goToDashboard(from: self)
    }
}

extension OnboardingVC {
    func setupViews() {
        view.addSubview(signInButton)
        signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        signInButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

extension OnboardingVC: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
        case let credentials as ASAuthorizationAppleIDCredential :
            
            var emailUser: String = ""
            var first: String = ""
            var second: String = ""
            
            if let firstname = credentials.fullName?.givenName {
                first = firstname
//                print(firstname)
            }
            
            if let lastname = credentials.fullName?.familyName {
                second = lastname
//                print(lastname)
            }
            
            if let email = credentials.email {
                emailUser = email
//                print(email)
            }
            
            let user = credentials.user
            if emailUser == "" {
                presentor?.didSuccessLoginWithApple(appleUserId: user)
            } else {
                presentor?.didSuccessLoginWithApple(first: first, second: second, email: emailUser, appleUserId: user)
            }
            break
        default:
            break
        }
    }
}
