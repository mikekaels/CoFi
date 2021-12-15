//
//  OnboardingPresenter.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 15/12/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

class OnboardingPresenter: OnboardingViewToPresenterProtocol {
    
    var view: OnboardingPresenterToViewProtocol?
    var router: OnboardingPresenterToRouterProtocol?
    var interactor: OnboardingPresenterToInteractorProtocol?
    
    func appleSignIn(from: OnboardingVC) {
        interactor?.appleSignIn(from: from)
    }
    
    func didSuccessLoginWithApple(first: String, second: String, email: String, appleUserId: String) {
        interactor?.didSuccessLoginWithApple(first: first, second: second, email: email, appleUserId: appleUserId)
    }
    
    func didSuccessLoginWithApple(appleUserId: String) {
        interactor?.didSuccessLoginWithApple(appleUserId: appleUserId)
    }
    
    func goToDashboard(from: OnboardingVC) {
        router?.goToDashboard(from: from)
    }
}

extension OnboardingPresenter: OnboardingInteractorToPresenterProtocol {
    func didSuccessLogin(user: User) {
        view?.didSuccessLogin(user: user)
    }
}
