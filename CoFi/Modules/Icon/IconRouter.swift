//
//  IconRouter.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 15/12/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.


import UIKit

public class IconRouter: IconPresenterToRouterProtocol{
    public static let shared = IconRouter()
    
    func initialize() -> IconVC {
        return createModule()
    }
    
    func createModule() -> IconVC {
        let view = IconVC()
        
        let presenter: IconViewToPresenterProtocol & IconInteractorToPresenterProtocol = IconPresenter()
        
        let interactor: IconPresenterToInteractorProtocol = IconInteractor()
        
        let router: IconPresenterToRouterProtocol = IconRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        return view
    }
}
