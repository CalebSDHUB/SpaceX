//
//  ViewController.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 01.04.2023.
//

import SwiftUI

/// Reponsible for showing all past SpaceX launches
final class LaunchScreenTableViewController: UITableViewController {
    private var viewModelsOriginal: [ViewModel] = [] { didSet { tableView.reloadData() } }
    private var viewModelsCurrent: [ViewModel] = [] { didSet { tableView.reloadData() } }
    
    private lazy var webManager: WebManager = {
        let webManager = ManagerFactory.create() as! WebManager
        webManager.delegate = self
        return webManager
    }()
    
    private lazy var launchSortBarButtonItem: UIBarButtonItem = {
        let barbuttomItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(launchSortButtonPressed))
        barbuttomItem.tintColor = .orange
        return barbuttomItem
    }()
    
    private lazy var launchFilterBarButtonItem: UIBarButtonItem = {
        let barbuttomItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(launchFilterButtonPressed))
        barbuttomItem.tintColor = .orange
        return barbuttomItem
    }()
    
    private lazy var searchController: UISearchController = {
        let searchController = UISearchController()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        return searchController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        webManager.update()
    }
}

// MARK: - Private functions

extension LaunchScreenTableViewController {
    private func setupUI() {
        title = Constant.LaunchScreen.Title.name
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.leftBarButtonItem = launchFilterBarButtonItem
        navigationItem.rightBarButtonItem = launchSortBarButtonItem
        navigationItem.searchController = searchController
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constant.LaunchScreen.Cell.identifier)
    }
    
    @objc private func launchSortButtonPressed() {
        let alertController = UIAlertController(title: Constant.LaunchScreen.NavigationItemButton.title, message: nil, preferredStyle: .actionSheet)
        
        alertController.addAction(UIAlertAction(title: Constant.LaunchScreen.NavigationItemButton.date, style: .default) { [weak self] _ in
            guard let self else { return }
            Context.setStrategy(strategy: DateSortStrategy())
            self.viewModelsCurrent = Context.executeStrategy(viewModels: self.viewModelsCurrent as! [LaunchViewModel])
            self.viewModelsOriginal = self.viewModelsCurrent
        })
        alertController.addAction(UIAlertAction(title: Constant.LaunchScreen.NavigationItemButton.name, style: .default) { [weak self] _ in
            guard let self else { return }
            Context.setStrategy(strategy: NameSortStrategy())
            self.viewModelsCurrent = Context.executeStrategy(viewModels: self.viewModelsCurrent as! [LaunchViewModel])
            self.viewModelsOriginal = self.viewModelsCurrent
        })
        
        alertController.view.tintColor = .orange
        present(alertController, animated: true)
    }
    
    private func resetViewModelCurrent() {
        viewModelsCurrent = viewModelsOriginal
    }
    
    @objc private func launchFilterButtonPressed() {
        webManager.update()
        resetViewModelCurrent()
    }
}

// MARK: - WebManagerDelegate

extension LaunchScreenTableViewController: WebManagerDelegate {
    func update(viewModels: [ViewModel]) {
        Task {
            viewModelsOriginal = viewModels
            viewModelsCurrent = viewModels
        }
    }
}

// MARK: - UITableViewController override functions

extension LaunchScreenTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModelsCurrent.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.LaunchScreen.Cell.identifier, for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.contentConfiguration = UIHostingConfiguration { LaunchCellView(launchViewModel: viewModelsCurrent[indexPath.row] as! LaunchViewModel) }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(UIHostingController(rootView: DetailView(launchViewModel: viewModelsCurrent[indexPath.row] as! LaunchViewModel)), animated: true)
    }
}

// MARK: - UISearchResultsUpdating

extension LaunchScreenTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else { return }
        let launchViewModels = viewModelsOriginal as! [LaunchViewModel]
        let filteredTitle = launchViewModels.map { $0.title }.enumerated().filter({ $0.element.localizedCaseInsensitiveContains(searchText) })
        let filteredModels = filteredTitle.map { launchViewModels[$0.offset] }
        
        if !searchText.isEmpty {
            viewModelsCurrent = filteredModels
        }
    }
}

// MARK: - UISearchBarDelegate

extension LaunchScreenTableViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        resetViewModelCurrent()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchController.searchBar.text else { return }
        if !searchText.isEmpty {
            searchBar.text = ""
            searchController.isActive = false
        }

    }
}


