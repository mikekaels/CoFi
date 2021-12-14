//
//  AddItemProtocol.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 14/12/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

public protocol AddItemDelegate {
    
}

protocol AddItemViewToPresenterProtocol: AnyObject {
    var view: AddItemPresenterToViewProtocol? { get set }
    var interactor: AddItemPresenterToInteractorProtocol? { get set }
    var router: AddItemPresenterToRouterProtocol? { get set }
}

protocol AddItemPresenterToRouterProtocol: AnyObject {
    func createModule() -> AddItemVC
}

protocol AddItemPresenterToViewProtocol: AnyObject {

}

protocol AddItemInteractorToPresenterProtocol: AnyObject {

}

protocol AddItemPresenterToInteractorProtocol: AnyObject {
    var presenter: AddItemInteractorToPresenterProtocol? { get set }

}
