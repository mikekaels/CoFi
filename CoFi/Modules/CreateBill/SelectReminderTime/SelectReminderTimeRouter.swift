//
//  SelectReminderTimeRouter.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 14/12/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.


import UIKit

public class SelectReminderTimeRouter: SelectReminderTimePresenterToRouterProtocol{
    public static let shared = SelectReminderTimeRouter()
    
    func initialize() -> SelectReminderTimeVC {
        return createModule()
    }
    
    func createModule() -> SelectReminderTimeVC {
        let view = SelectReminderTimeVC()
        
        let presenter: SelectReminderTimeViewToPresenterProtocol & SelectReminderTimeInteractorToPresenterProtocol = SelectReminderTimePresenter()
        
        let interactor: SelectReminderTimePresenterToInteractorProtocol = SelectReminderTimeInteractor()
        
        let router: SelectReminderTimePresenterToRouterProtocol = SelectReminderTimeRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        return view
    }
}
