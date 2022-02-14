//
//  DetailRouter.swift
//  VIPERSampleApp
//
//  Created by Waseem Wani on 28/01/22.
//

import Foundation

class DetailRouter: DetailRouterProtocol {
    var entryPoint: DetailViewProtocol?
    
    static func start(restaurantName: String) -> DetailRouterProtocol {
        var router: DetailRouterProtocol = DetailRouter()
        let viewController: DetailViewController = .instantiate()
        print(viewController)
        let view: DetailViewProtocol = viewController
        var interactor: DetailInteractorProtocol = DetailInteractor()
        var presenter: DetailPresenterProtocol = DetailPresenter()
        
        view.presenter = presenter
        interactor.presenter = presenter
        interactor.restaurantName = restaurantName
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        router.entryPoint = view
        
        return router
    }
}
