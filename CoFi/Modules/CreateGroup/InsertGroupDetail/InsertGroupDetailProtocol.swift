//
//  InsertGroupDetailProtocol.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 14/12/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

public protocol InsertGroupDetailDelegate {
    func didSubmitGroupDetails(groupDetail: String)
}

protocol InsertGroupDetailViewToPresenterProtocol: AnyObject {
    var view: InsertGroupDetailPresenterToViewProtocol? { get set }
    var interactor: InsertGroupDetailPresenterToInteractorProtocol? { get set }
    var router: InsertGroupDetailPresenterToRouterProtocol? { get set }
    
    func _dismiss(from: InsertGroupDetailVC, groupDetail: String)
}

protocol InsertGroupDetailPresenterToRouterProtocol: AnyObject {
    func createModule() -> InsertGroupDetailVC
    func _dismiss(from: InsertGroupDetailVC, groupDetail: String)
}

protocol InsertGroupDetailPresenterToViewProtocol: AnyObject {

}

protocol InsertGroupDetailInteractorToPresenterProtocol: AnyObject {

}

protocol InsertGroupDetailPresenterToInteractorProtocol: AnyObject {
    var presenter: InsertGroupDetailInteractorToPresenterProtocol? { get set }

}
