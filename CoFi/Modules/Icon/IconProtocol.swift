//
//  IconProtocol.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 15/12/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

public protocol IconDelegate {
    
}

protocol IconViewToPresenterProtocol: AnyObject {
    var view: IconPresenterToViewProtocol? { get set }
    var interactor: IconPresenterToInteractorProtocol? { get set }
    var router: IconPresenterToRouterProtocol? { get set }
}

protocol IconPresenterToRouterProtocol: AnyObject {
    func createModule() -> IconVC
}

protocol IconPresenterToViewProtocol: AnyObject {

}

protocol IconInteractorToPresenterProtocol: AnyObject {

}

protocol IconPresenterToInteractorProtocol: AnyObject {
    var presenter: IconInteractorToPresenterProtocol? { get set }

}
