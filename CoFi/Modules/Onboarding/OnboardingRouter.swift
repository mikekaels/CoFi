//
//  OnboardingRouter.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 15/12/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.


import UIKit

public class OnboardingRouter: OnboardingPresenterToRouterProtocol{
    public static let shared = OnboardingRouter()
    
    func initialize() -> OnboardingVC {
        return createModule()
    }
    
    func createModule() -> OnboardingVC {
        let view = OnboardingVC()
        
        let presenter: OnboardingViewToPresenterProtocol & OnboardingInteractorToPresenterProtocol = OnboardingPresenter()
        
        let interactor: OnboardingPresenterToInteractorProtocol = OnboardingInteractor()
        
        let router: OnboardingPresenterToRouterProtocol = OnboardingRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        return view
    }
    
    func goToDashboard(from: OnboardingVC) {
        let vc = TabBarRouter().createModule()
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        nav.modalTransitionStyle = .crossDissolve
        from.present(nav, animated: true, completion: nil)
    }
}
