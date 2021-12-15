//
//  CreateGroupInteractor.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 13/12/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

class CreateGroupInteractor: CreateGroupPresenterToInteractorProtocol {
    var presenter: CreateGroupInteractorToPresenterProtocol?
}

extension CreateGroupInteractor {
    func findUser(user: String) {
        FirebaseHelper.getUser(userEmail: user) { result in
            switch result {
            case .success(let user):
                self.presenter?.didFetchUser(users: user)
            case .failure(let err):
                print(err)
            }
        }
    }
}
