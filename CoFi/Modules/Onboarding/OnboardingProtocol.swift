//
//  OnboardingProtocol.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 15/12/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

public protocol OnboardingDelegate {
    
}

protocol OnboardingViewToPresenterProtocol: AnyObject {
    var view: OnboardingPresenterToViewProtocol? { get set }
    var interactor: OnboardingPresenterToInteractorProtocol? { get set }
    var router: OnboardingPresenterToRouterProtocol? { get set }
    
    func appleSignIn(from: OnboardingVC)
    func didSuccessLoginWithApple(first: String, second: String, email: String, appleUserId: String)
    
    func didSuccessLoginWithApple(appleUserId: String)
    func goToDashboard(from: OnboardingVC)
}

protocol OnboardingPresenterToRouterProtocol: AnyObject {
    func createModule() -> OnboardingVC
    func goToDashboard(from: OnboardingVC)
}

protocol OnboardingPresenterToViewProtocol: AnyObject {
    func didSuccessLogin(user: User)
}

protocol OnboardingInteractorToPresenterProtocol: AnyObject {
    func didSuccessLogin(user: User)
}

protocol OnboardingPresenterToInteractorProtocol: AnyObject {
    var presenter: OnboardingInteractorToPresenterProtocol? { get set }
    func appleSignIn(from: OnboardingVC)
    func didSuccessLoginWithApple(first: String, second: String, email: String, appleUserId: String)
    func didSuccessLoginWithApple(appleUserId: String)
}
