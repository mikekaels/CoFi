//
//  CreateExpenseProtocol.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 14/12/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

public protocol CreateExpenseDelegate {
    
}

protocol CreateExpenseViewToPresenterProtocol: AnyObject {
    var view: CreateExpensePresenterToViewProtocol? { get set }
    var interactor: CreateExpensePresenterToInteractorProtocol? { get set }
    var router: CreateExpensePresenterToRouterProtocol? { get set }
    
    
}

protocol CreateExpensePresenterToRouterProtocol: AnyObject {
    func createModule() -> CreateExpenseVC
}

protocol CreateExpensePresenterToViewProtocol: AnyObject {

}

protocol CreateExpenseInteractorToPresenterProtocol: AnyObject {

}

protocol CreateExpensePresenterToInteractorProtocol: AnyObject {
    var presenter: CreateExpenseInteractorToPresenterProtocol? { get set }

}
