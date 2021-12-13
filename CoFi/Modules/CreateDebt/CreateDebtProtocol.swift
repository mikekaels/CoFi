//
//  CreateDebtProtocol.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 14/12/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

public protocol CreateDebtDelegate {
    
}

protocol CreateDebtViewToPresenterProtocol: AnyObject {
    var view: CreateDebtPresenterToViewProtocol? { get set }
    var interactor: CreateDebtPresenterToInteractorProtocol? { get set }
    var router: CreateDebtPresenterToRouterProtocol? { get set }
}

protocol CreateDebtPresenterToRouterProtocol: AnyObject {
    func createModule() -> CreateDebtVC
}

protocol CreateDebtPresenterToViewProtocol: AnyObject {

}

protocol CreateDebtInteractorToPresenterProtocol: AnyObject {

}

protocol CreateDebtPresenterToInteractorProtocol: AnyObject {
    var presenter: CreateDebtInteractorToPresenterProtocol? { get set }

}
