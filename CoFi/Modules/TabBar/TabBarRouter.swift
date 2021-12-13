//
//  TabBarRouter.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 12/12/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.


import UIKit

public class TabBarRouter: TabBarPresenterToRouterProtocol{
    public static let shared = TabBarRouter()
    
    func initialize() -> TabBarVC {
        return createModule()
    }
    
    func createModule() -> TabBarVC {
        let view = TabBarVC()
        
        let presenter: TabBarViewToPresenterProtocol & TabBarInteractorToPresenterProtocol = TabBarPresenter()
        
        let interactor: TabBarPresenterToInteractorProtocol = TabBarInteractor()
        
        let router: TabBarPresenterToRouterProtocol = TabBarRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        return view
    }
}
