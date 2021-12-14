//
//  SelectReminderTimeProtocol.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 14/12/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

public protocol SelectReminderTimeDelegate {
    
}

protocol SelectReminderTimeViewToPresenterProtocol: AnyObject {
    var view: SelectReminderTimePresenterToViewProtocol? { get set }
    var interactor: SelectReminderTimePresenterToInteractorProtocol? { get set }
    var router: SelectReminderTimePresenterToRouterProtocol? { get set }
}

protocol SelectReminderTimePresenterToRouterProtocol: AnyObject {
    func createModule() -> SelectReminderTimeVC
}

protocol SelectReminderTimePresenterToViewProtocol: AnyObject {

}

protocol SelectReminderTimeInteractorToPresenterProtocol: AnyObject {

}

protocol SelectReminderTimePresenterToInteractorProtocol: AnyObject {
    var presenter: SelectReminderTimeInteractorToPresenterProtocol? { get set }

}
