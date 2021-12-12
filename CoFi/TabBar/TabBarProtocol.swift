//
//  TabBarProtocol.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 12/12/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

public protocol TabBarDelegate {
    
}

protocol TabBarViewToPresenterProtocol: AnyObject {
    var view: TabBarPresenterToViewProtocol? { get set }
    var interactor: TabBarPresenterToInteractorProtocol? { get set }
    var router: TabBarPresenterToRouterProtocol? { get set }
}

protocol TabBarPresenterToRouterProtocol: AnyObject {
    func createModule() -> TabBarVC
}

protocol TabBarPresenterToViewProtocol: AnyObject {

}

protocol TabBarInteractorToPresenterProtocol: AnyObject {

}

protocol TabBarPresenterToInteractorProtocol: AnyObject {
    var presenter: TabBarInteractorToPresenterProtocol? { get set }

}
