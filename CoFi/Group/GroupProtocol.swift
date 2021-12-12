//
//  GroupProtocol.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 12/12/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

public protocol GroupDelegate {
    
}

protocol GroupViewToPresenterProtocol: AnyObject {
    var view: GroupPresenterToViewProtocol? { get set }
    var interactor: GroupPresenterToInteractorProtocol? { get set }
    var router: GroupPresenterToRouterProtocol? { get set }
}

protocol GroupPresenterToRouterProtocol: AnyObject {
    func createModule() -> GroupVC
}

protocol GroupPresenterToViewProtocol: AnyObject {

}

protocol GroupInteractorToPresenterProtocol: AnyObject {

}

protocol GroupPresenterToInteractorProtocol: AnyObject {
    var presenter: GroupInteractorToPresenterProtocol? { get set }

}
