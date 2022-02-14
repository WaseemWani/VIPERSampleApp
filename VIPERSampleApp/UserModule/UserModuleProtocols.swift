//
//  UserModuleProtocols.swift
//  VIPERSampleApp
//
//  Created by Waseem Wani on 06/02/22.
//

import Foundation
import UIKit

typealias EntryPoint = ViewProtocol & UIViewController

protocol ViewProtocol: AnyObject {
    var presenter: Presenter? { get set }
    func update(with restaurants: [Restaurant])
    func update(with error: Error)
}

protocol Interactor {
    var presenter: Presenter? { get set }
    func fetchRestaurants()
}


protocol Presenter {
    var interactor: Interactor? { get set }
    var view: ViewProtocol? { get set }
    var router: Router? { get set }
    
    func didFetchRestaurants(result: Result<[Restaurant], APIError>)
    func showDetails(restaurantName: String)
}


protocol Router {
    var entryPoint: EntryPoint? { get set }
    static func start() -> Router
    func routToDetailScreen(restaurantName: String)
}

enum APIError: Error {
    case failed
}
