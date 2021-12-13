//
//  GroupDetailsProtocol.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 13/12/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

public protocol GroupDetailsDelegate {
    
}

protocol GroupDetailsViewToPresenterProtocol: AnyObject {
    var view: GroupDetailsPresenterToViewProtocol? { get set }
    var interactor: GroupDetailsPresenterToInteractorProtocol? { get set }
    var router: GroupDetailsPresenterToRouterProtocol? { get set }
    
    func back(from: GroupDetailsVC)
}

protocol GroupDetailsPresenterToRouterProtocol: AnyObject {
    func createModule() -> GroupDetailsVC
    func back(from: GroupDetailsVC)
}

protocol GroupDetailsPresenterToViewProtocol: AnyObject {

}

protocol GroupDetailsInteractorToPresenterProtocol: AnyObject {

}

protocol GroupDetailsPresenterToInteractorProtocol: AnyObject {
    var presenter: GroupDetailsInteractorToPresenterProtocol? { get set }

}
