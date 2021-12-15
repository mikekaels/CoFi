//
//  CreateBillProtocol.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 14/12/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

public protocol CreateBillDelegate {
    
}

protocol CreateBillViewToPresenterProtocol: AnyObject {
    var view: CreateBillPresenterToViewProtocol? { get set }
    var interactor: CreateBillPresenterToInteractorProtocol? { get set }
    var router: CreateBillPresenterToRouterProtocol? { get set }
    
    func goToSelectReminderTime(from: CreateBillVC)
    func goToIcon(from: CreateBillVC)
}

protocol CreateBillPresenterToRouterProtocol: AnyObject {
    func createModule() -> CreateBillVC
    func goToSelectReminderTime(from: CreateBillVC)
    func goToIcon(from: CreateBillVC)
}

protocol CreateBillPresenterToViewProtocol: AnyObject {

}

protocol CreateBillInteractorToPresenterProtocol: AnyObject {

}

protocol CreateBillPresenterToInteractorProtocol: AnyObject {
    var presenter: CreateBillInteractorToPresenterProtocol? { get set }

}
