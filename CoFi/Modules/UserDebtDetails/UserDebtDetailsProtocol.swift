//
//  UserDebtDetailsProtocol.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 14/12/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

public protocol UserDebtDetailsDelegate {
    
}

protocol UserDebtDetailsViewToPresenterProtocol: AnyObject {
    var view: UserDebtDetailsPresenterToViewProtocol? { get set }
    var interactor: UserDebtDetailsPresenterToInteractorProtocol? { get set }
    var router: UserDebtDetailsPresenterToRouterProtocol? { get set }
}

protocol UserDebtDetailsPresenterToRouterProtocol: AnyObject {
    func createModule() -> UserDebtDetailsVC
}

protocol UserDebtDetailsPresenterToViewProtocol: AnyObject {

}

protocol UserDebtDetailsInteractorToPresenterProtocol: AnyObject {

}

protocol UserDebtDetailsPresenterToInteractorProtocol: AnyObject {
    var presenter: UserDebtDetailsInteractorToPresenterProtocol? { get set }

}
