//
//  TransactionRouter.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 12/12/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.


import UIKit

public class TransactionRouter: TransactionPresenterToRouterProtocol{
    public static let shared = TransactionRouter()
    
    func initialize() -> TransactionVC {
        return createModule()
    }
    
    func createModule() -> TransactionVC {
        let view = TransactionVC()
        
        let presenter: TransactionViewToPresenterProtocol & TransactionInteractorToPresenterProtocol = TransactionPresenter()
        
        let interactor: TransactionPresenterToInteractorProtocol = TransactionInteractor()
        
        let router: TransactionPresenterToRouterProtocol = TransactionRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        return view
    }
}
