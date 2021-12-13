//
//  GroupProtocol.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 12/12/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import Foundation

public protocol GroupDelegate {
    
}

protocol GroupViewToPresenterProtocol: AnyObject {
    var view: GroupPresenterToViewProtocol? { get set }
    var interactor: GroupPresenterToInteractorProtocol? { get set }
    var router: GroupPresenterToRouterProtocol? { get set }
    
    func goToDetail(from: GroupVC, index: String)
}

protocol GroupPresenterToRouterProtocol: AnyObject {
    func createModule() -> GroupVC
    func goToDetail(from: GroupVC, index: String)
}

protocol GroupPresenterToViewProtocol: AnyObject {
    
}

protocol GroupInteractorToPresenterProtocol: AnyObject {

}

protocol GroupPresenterToInteractorProtocol: AnyObject {
    var presenter: GroupInteractorToPresenterProtocol? { get set }

}
