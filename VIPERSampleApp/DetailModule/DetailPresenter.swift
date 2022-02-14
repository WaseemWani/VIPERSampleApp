//
//  DetailPresenter.swift
//  VIPERSampleApp
//
//  Created by Waseem Wani on 28/01/22.
//

import Foundation

class DetailPresenter: DetailPresenterProtocol {
    var interactor: DetailInteractorProtocol? {
        didSet {
            interactor?.fetchRestaurantDetails()
        }
    }
    
    var view: DetailViewProtocol?
    var router: DetailRouterProtocol?
            
    func didFetchData(with result: Result<RestaurantDetail, APIError>) {
        switch result {
            case .success(let restaurantDetails):
                view?.update(with: restaurantDetails)
            case .failure(let error):
                view?.update(with: error)
        }
    }
}
