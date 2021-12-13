//
//  GroupDetailsRouter.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 13/12/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.


import UIKit

public class GroupDetailsRouter: GroupDetailsPresenterToRouterProtocol{
    public static let shared = GroupDetailsRouter()
    
    func initialize() -> GroupDetailsVC {
        return createModule()
    }
    
    func createModule() -> GroupDetailsVC {
        let view = GroupDetailsVC()
        
        let presenter: GroupDetailsViewToPresenterProtocol & GroupDetailsInteractorToPresenterProtocol = GroupDetailsPresenter()
        
        let interactor: GroupDetailsPresenterToInteractorProtocol = GroupDetailsInteractor()
        
        let router: GroupDetailsPresenterToRouterProtocol = GroupDetailsRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        return view
    }
    
    func back(from: GroupDetailsVC) {
        from.dismiss(animated: true, completion: nil)
    }
}
