//
//  GroupRouter.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 12/12/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.


import UIKit

public class GroupRouter: GroupPresenterToRouterProtocol{
    public static let shared = GroupRouter()
    
    func initialize() -> GroupVC {
        return createModule()
    }
    
    func createModule() -> GroupVC {
        let view = GroupVC()
        
        let presenter: GroupViewToPresenterProtocol & GroupInteractorToPresenterProtocol = GroupPresenter()
        
        let interactor: GroupPresenterToInteractorProtocol = GroupInteractor()
        
        let router: GroupPresenterToRouterProtocol = GroupRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        return view
    }
    
    func goToDetail(from: GroupVC, index: String) {
        let vc = GroupDetailsRouter().createModule()
        vc.id = index
        vc.modalPresentationStyle = .fullScreen
        from.present(vc, animated: true, completion: nil)
    }
    
    func goToCreateGroup(from: GroupVC) {
        let vc = CreateGroupRouter().createModule()
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        from.present(nav, animated: true, completion: nil)
    }
}
