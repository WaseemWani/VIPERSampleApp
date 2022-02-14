//
//  ViewController.swift
//  VIPERSampleApp
//
//  Created by Waseem Wani on 22/01/22.
//

import UIKit

class ViewController: UIViewController, ViewProtocol {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var errorLabel: UILabel!
    
    var presenter: Presenter?
    var restaurants = [Restaurant]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        self.title = "Restaurants"
        navigationItem.backButtonTitle = " "
        navigationController?.navigationBar.backIndicatorImage = UIImage(systemName: "arrow.backward", withConfiguration: UIImage.SymbolConfiguration(pointSize: 16, weight: .bold))
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(systemName: "arrow.backward", withConfiguration: UIImage.SymbolConfiguration(pointSize: 16, weight: .bold))
        navigationController?.navigationBar.tintColor = .black
        tableView.isHidden = false
        errorLabel.isHidden = true
    }
    
    func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
    }
        
    
    func update(with restaurants: [Restaurant]) {
        DispatchQueue.main.async {
            self.tableView.isHidden = false
            self.errorLabel.isHidden = true
            self.restaurants = restaurants
            self.tableView.reloadData()
        }
    }
    
    func update(with error: Error) {
        tableView.isHidden = true
        errorLabel.isHidden = false
        errorLabel.text = error.localizedDescription
    }
    
    deinit {
        print("user vc deallocated")
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        restaurants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell() }
        cell.selectionStyle = .none
            cell.textLabel?.text = restaurants[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        guard let restaurantName = cell?.textLabel?.text else { return }
        presenter?.showDetails(restaurantName: restaurantName)
    }
}
