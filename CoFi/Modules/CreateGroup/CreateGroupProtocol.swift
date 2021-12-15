//
//  CreateGroupProtocol.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 13/12/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

public protocol CreateGroupDelegate {
    
}

protocol CreateGroupViewToPresenterProtocol: AnyObject {
    var view: CreateGroupPresenterToViewProtocol? { get set }
    var interactor: CreateGroupPresenterToInteractorProtocol? { get set }
    var router: CreateGroupPresenterToRouterProtocol? { get set }
    
    func back(from: CreateGroupVC)
    func goToInsertGroupDetail(from: CreateGroupVC)
    func findUser(user: String)
    
}

protocol CreateGroupPresenterToRouterProtocol: AnyObject {
    func createModule() -> CreateGroupVC
    func back(from: CreateGroupVC)
    func goToInsertGroupDetail(from: CreateGroupVC)
}

protocol CreateGroupPresenterToViewProtocol: AnyObject {
    func didFetchUser(users: [User])
}

protocol CreateGroupInteractorToPresenterProtocol: AnyObject {
    func didFetchUser(users: [User])
}

protocol CreateGroupPresenterToInteractorProtocol: AnyObject {
    var presenter: CreateGroupInteractorToPresenterProtocol? { get set }
    func findUser(user: String)
}
