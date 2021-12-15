//
//  CreateGroupRouter.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 13/12/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.


import UIKit

public class CreateGroupRouter: CreateGroupPresenterToRouterProtocol{
    public static let shared = CreateGroupRouter()
    
    func initialize() -> CreateGroupVC {
        return createModule()
    }
    
    func createModule() -> CreateGroupVC {
        let view = CreateGroupVC()
        
        let presenter: CreateGroupViewToPresenterProtocol & CreateGroupInteractorToPresenterProtocol = CreateGroupPresenter()
        
        let interactor: CreateGroupPresenterToInteractorProtocol = CreateGroupInteractor()
        
        let router: CreateGroupPresenterToRouterProtocol = CreateGroupRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        return view
    }
    
    func back(from: CreateGroupVC) {
        from.dismiss(animated: true, completion: nil)
    }
    
    func goToInsertGroupDetail(from: CreateGroupVC) {
        let vc = InsertGroupDetailRouter().createModule()
        vc.delegate = from
        from.navigationController?.pushViewController(vc, animated: true)
    }
}
