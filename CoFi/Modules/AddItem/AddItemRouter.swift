//
//  AddItemRouter.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 14/12/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.


import UIKit

public class AddItemRouter: AddItemPresenterToRouterProtocol{
    public static let shared = AddItemRouter()
    
    func initialize() -> AddItemVC {
        return createModule()
    }
    
    func createModule() -> AddItemVC {
        let view = AddItemVC()
        
        let presenter: AddItemViewToPresenterProtocol & AddItemInteractorToPresenterProtocol = AddItemPresenter()
        
        let interactor: AddItemPresenterToInteractorProtocol = AddItemInteractor()
        
        let router: AddItemPresenterToRouterProtocol = AddItemRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        return view
    }
}
