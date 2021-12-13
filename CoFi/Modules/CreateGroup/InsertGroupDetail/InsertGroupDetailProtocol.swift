//
//  InsertGroupDetailProtocol.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 14/12/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

public protocol InsertGroupDetailDelegate {
    
}

protocol InsertGroupDetailViewToPresenterProtocol: AnyObject {
    var view: InsertGroupDetailPresenterToViewProtocol? { get set }
    var interactor: InsertGroupDetailPresenterToInteractorProtocol? { get set }
    var router: InsertGroupDetailPresenterToRouterProtocol? { get set }
}

protocol InsertGroupDetailPresenterToRouterProtocol: AnyObject {
    func createModule() -> InsertGroupDetailVC
}

protocol InsertGroupDetailPresenterToViewProtocol: AnyObject {

}

protocol InsertGroupDetailInteractorToPresenterProtocol: AnyObject {

}

protocol InsertGroupDetailPresenterToInteractorProtocol: AnyObject {
    var presenter: InsertGroupDetailInteractorToPresenterProtocol? { get set }

}
