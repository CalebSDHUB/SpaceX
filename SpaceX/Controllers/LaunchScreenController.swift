//
//  ViewController.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 01.04.2023.
//

import SwiftUI

/// Reponsible for showing all past SpaceX launches
final class LaunchScreenTableViewController: UITableViewController {
    private var viewModels: [ViewModel] = []
    private var webManager = ManagerFactory.create() as! WebManager
    
    private lazy var launchFilterBarButtonItem: UIBarButtonItem = {
        let barbuttomItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(launchFilterButtonPressed))
        barbuttomItem.tintColor = .orange
        return barbuttomItem
    }()
    
    private lazy var searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        webManager.delegate = self
        webManager.update()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.LaunchScreen.Cell.identifier, for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.contentConfiguration = UIHostingConfiguration { LaunchCellView(launchViewModel: viewModels[indexPath.row] as! LaunchViewModel) }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(UIHostingController(rootView: DetailView(launchViewModel: viewModels[indexPath.row] as! LaunchViewModel)), animated: true)
    }
}

// MARK: - WebManagerDelegate

extension LaunchScreenTableViewController: WebManagerDelegate {
    func update(viewModels: [ViewModel]) {
        Task {
            self.viewModels = viewModels
            tableView.reloadData()
        }
    }
}

// MARK: - Private functions

extension LaunchScreenTableViewController {
    private func setupUI() {
        title = Constant.LaunchScreen.Title.name
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = launchFilterBarButtonItem
        navigationItem.searchController = searchController
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constant.LaunchScreen.Cell.identifier)
    }
    
    @objc private func launchFilterButtonPressed() {
        let alertController = UIAlertController(title: Constant.LaunchScreen.NavigationItemButton.title, message: nil, preferredStyle: .actionSheet)
        
        alertController.addAction(UIAlertAction(title: Constant.LaunchScreen.NavigationItemButton.date, style: .default) { [weak self] _ in
            Sort.setStrategy(strategy: DateSortStrategy())
            self?.viewModels = Sort.executeStrategy(viewModels: self?.viewModels as! [LaunchViewModel])
            self?.tableView.reloadData()
        })
        alertController.addAction(UIAlertAction(title: Constant.LaunchScreen.NavigationItemButton.name, style: .default) { [weak self] _ in
            Sort.setStrategy(strategy: NameSortStrategy())
            self?.viewModels = Sort.executeStrategy(viewModels: self?.viewModels as! [LaunchViewModel])
            self?.tableView.reloadData()
        })
        
        alertController.view.tintColor = .orange
        present(alertController, animated: true)
    }
}

