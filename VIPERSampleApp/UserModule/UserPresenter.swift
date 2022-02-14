//
//  UserPresenter.swift
//  VIPERSampleApp
//
//  Created by Waseem Wani on 22/01/22.
//

import Foundation

class UserPresenter: Presenter {

    var interactor: Interactor? {
        didSet {
            interactor?.fetchRestaurants()
        }
    }
    
    var view: ViewProtocol?
    
    var router: Router?
    
    func didFetchRestaurants(result: Result<[Restaurant], APIError>) {
        debugPrint("presenter did fetch called")
        switch result {
            case .success(let restaurants):
                view?.update(with: restaurants)
            case.failure(let error):
                view?.update(with: error)
        }
    }
    
    func showDetails(restaurantName: String) {
        debugPrint("details func called", restaurantName)
        router?.routToDetailScreen(restaurantName: restaurantName)
    }
}
