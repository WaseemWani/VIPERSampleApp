//
//  UserInteractor.swift
//  VIPERSampleApp
//
//  Created by Waseem Wani on 22/01/22.
//

import Foundation

class UserInteractor: Interactor {
    var presenter: Presenter?
    
    func fetchRestaurants() {
        guard let path = Bundle.main.path(forResource: "Restaurants", ofType: "json")
        else { return }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let restaurants = try JSONDecoder().decode([Restaurant].self, from: data)
            presenter?.didFetchRestaurants(result: .success(restaurants))
        }
        catch {
            presenter?.didFetchRestaurants(result: .failure(.failed))
        }
    }
}


//        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
//        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
//            guard let data = data, error == nil else {
//                self?.presenter?.didFetchUsers(result: .failure(.failed))
//                return
//            }
//            do {
//                let users = try JSONDecoder().decode([User].self, from: data)
//                self?.presenter?.didFetchUsers(result: .success(users))
//            }
//            catch {
//                self?.presenter?.didFetchUsers(result: .failure(.failed))
//            }
//        }
//        task.resume()
