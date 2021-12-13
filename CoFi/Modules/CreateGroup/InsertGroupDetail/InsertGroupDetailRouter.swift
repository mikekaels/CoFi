//
//  InsertGroupDetailRouter.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 14/12/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.


import UIKit

public class InsertGroupDetailRouter: InsertGroupDetailPresenterToRouterProtocol{
    public static let shared = InsertGroupDetailRouter()
    
    func initialize() -> InsertGroupDetailVC {
        return createModule()
    }
    
    func createModule() -> InsertGroupDetailVC {
        let view = InsertGroupDetailVC()
        
        let presenter: InsertGroupDetailViewToPresenterProtocol & InsertGroupDetailInteractorToPresenterProtocol = InsertGroupDetailPresenter()
        
        let interactor: InsertGroupDetailPresenterToInteractorProtocol = InsertGroupDetailInteractor()
        
        let router: InsertGroupDetailPresenterToRouterProtocol = InsertGroupDetailRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        return view
    }
}
