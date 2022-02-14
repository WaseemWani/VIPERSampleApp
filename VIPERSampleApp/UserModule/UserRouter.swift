//
//  UserRouter.swift
//  VIPERSampleApp
//
//  Created by Waseem Wani on 22/01/22.
//

import Foundation

class UserRouter: Router {
    var entryPoint: EntryPoint?
    
    static func start() -> Router {
        var router: Router = UserRouter()
        let viewController: ViewController = .instantiate()
        let view: ViewProtocol = viewController
        var interactor: Interactor = UserInteractor()
        var presenter: Presenter = UserPresenter()
        
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor
        router.entryPoint = view as? EntryPoint
        
        return router
    }
    
    func routToDetailScreen(restaurantName: String) {
        let router = DetailRouter.start(restaurantName: restaurantName)
        guard let detailVC = router.entryPoint else { return }
        print(detailVC)
        entryPoint?.navigationController?.pushViewController(detailVC, animated: true)
    }
}
