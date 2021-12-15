//
//  OnboardingInteractor.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 15/12/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import AuthenticationServices

class OnboardingInteractor: OnboardingPresenterToInteractorProtocol {
    var presenter: OnboardingInteractorToPresenterProtocol?
}

extension OnboardingInteractor {
    func appleSignIn(from: OnboardingVC) {
        let provider = ASAuthorizationAppleIDProvider()
        let request = provider.createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = from as ASAuthorizationControllerDelegate
        controller.presentationContextProvider = from as? ASAuthorizationControllerPresentationContextProviding
        controller.performRequests()
    }
    
    func didSuccessLoginWithApple(first: String, second: String, email: String, appleUserId: String) {
        FirebaseHelper.addUser(first: first, second: second, email: email, appleUserId: appleUserId) { result in
            switch result {
            case .success(.result(let data)):
                self.presenter?.didSuccessLogin(user: data)
            case .failure(let err):
                print(err)
            case .success(.empty):
                print("EMPTY")
            }
            
        }
    }
    
    func didSuccessLoginWithApple(appleUserId: String) {
        FirebaseHelper.getUserWithAppleId(appleId: appleUserId) { result in
            switch result {
            case .success(.result(let data)):
                self.presenter?.didSuccessLogin(user: data)
            case .failure(let err):
                print("ERR: ", err)
            case .success(.empty):
                print("EMPTY")
            }
        }
    }
}
