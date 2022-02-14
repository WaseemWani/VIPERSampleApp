//
//  Detailnteractor.swift
//  VIPERSampleApp
//
//  Created by Waseem Wani on 28/01/22.
//

import Foundation

class DetailInteractor: DetailInteractorProtocol {
    var presenter: DetailPresenterProtocol?
    
    var restaurantName: String?
        
    func fetchRestaurantDetails() {
        guard let path = Bundle.main.path(forResource: "Restaurants", ofType: "json") else { return }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let decodedData =  try JSONDecoder().decode([RestaurantDetail].self, from: data)
            guard let restaurantDetails = decodedData.filter({ $0.name == restaurantName }).first else {
                presenter?.didFetchData(with: .failure(.failed))
                return
            }
            presenter?.didFetchData(with: .success(restaurantDetails ))
        }
        catch {
            presenter?.didFetchData(with: .failure(.failed))
        }
    }
    
}
