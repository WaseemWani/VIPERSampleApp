//
//  DetailViewController.swift
//  VIPERSampleApp
//
//  Created by Waseem Wani on 28/01/22.
//

import UIKit

class DetailViewController: UIViewController, DetailViewProtocol {
    var presenter: DetailPresenterProtocol?
    
    @IBOutlet var fadeinOutView: UIView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var restaurantTypeLabel: UILabel!
    @IBOutlet var stackView: UIStackView!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Restaurant Details"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 1.5, delay: 0.2, options: .curveEaseInOut, animations: {
//            self.fadeinOutView.backgroundColor = .systemRed
            self.fadeinOutView.alpha = 1
        })
    }

    func update(with restaurantDetails: RestaurantDetail) {
        DispatchQueue.main.async {
            self.stackView.isHidden = false
            self.errorLabel.isHidden = true
            self.nameLabel.text = restaurantDetails.name
            self.restaurantTypeLabel.text = restaurantDetails.type
            self.addressLabel.text = restaurantDetails.address
            self.ratingLabel.text = restaurantDetails.google_rating
        }
    }
    
    func update(with error: Error) {
        DispatchQueue.main.async {
            self.stackView.isHidden = true
            self.errorLabel.isHidden = false
            self.errorLabel.text =  error.localizedDescription
        }
    }
    

    deinit {
        debugPrint("detail deallocated")
    }
}
