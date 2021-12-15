//
//  InsertGroupDetailPresenter.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 14/12/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

class InsertGroupDetailPresenter: InsertGroupDetailViewToPresenterProtocol {
    var view: InsertGroupDetailPresenterToViewProtocol?
    var router: InsertGroupDetailPresenterToRouterProtocol?
    var interactor: InsertGroupDetailPresenterToInteractorProtocol?
    
    func _dismiss(from: InsertGroupDetailVC, groupDetail: String) {
        router?._dismiss(from: from, groupDetail: groupDetail)
    }
}

extension InsertGroupDetailPresenter: InsertGroupDetailInteractorToPresenterProtocol {

}
