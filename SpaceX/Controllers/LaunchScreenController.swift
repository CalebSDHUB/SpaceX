//
//  ViewController.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 01.04.2023.
//

import SwiftUI

/// Reponsible for showing the main SpaceX launch screen
final class LaunchScreenTableViewController: UITableViewController {
    private var viewModelsOriginal: [ViewModel] = [] { didSet { tableView.reloadData() } }
    private var viewModelsCurrent: [ViewModel] = [] { didSet { tableView.reloadData() } }
    
    private lazy var manager: Manager = {
        let manager = Manager.shared
        manager.delegate = self
        return manager
    }()
    
    private lazy var launchSortBarButtonItem: UIBarButtonItem = {
        let barbuttomItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(launchSortButtonPressed))
        barbuttomItem.tintColor = .orange
        return barbuttomItem
    }()
    
    private lazy var launchFilterBarButtonItem: UIBarButtonItem = {
        let barbuttomItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(launchRefreshButtonPressed))
        barbuttomItem.tintColor = .orange
        return barbuttomItem
    }()
    
    private lazy var searchController: UISearchController = {
        let searchController = UISearchController()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        return searchController
    }()
    
    private lazy var messageAnimation: UIAnimationLabel = {
        let animationMessage = UIAnimationLabel(frame: CGRect())
        return animationMessage
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        manager.update()
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
        addConstraints()
    }
    
    private func addConstraints() {
        messageAnimation.translatesAutoresizingMaskIntoConstraints = false
        if let titleView = navigationItem.titleView {
            NSLayoutConstraint.activate([
                messageAnimation.centerXAnchor.constraint(equalTo: titleView.centerXAnchor)
            ])
        }
    }
    
    private func messageAnimationTitleView() async throws {
        navigationItem.titleView = messageAnimation
        messageAnimation.animate()
        try await Task.sleep(for: Duration.milliseconds(Constant.LaunchScreen.Sleep.time))
        navigationItem.titleView = nil
    }
    
    private func resetViewModelCurrent() {
        viewModelsCurrent = viewModelsOriginal
    }
    
    @objc private func launchSortButtonPressed() {
        let alertController = UIAlertController(title: Constant.LaunchScreen.NavigationItemButton.title, message: nil, preferredStyle: .actionSheet)
        
        alertController.addAction(UIAlertAction(title: Constant.LaunchScreen.NavigationItemButton.date, style: .default) { [weak self] _ in
            guard let self else { return }
            Sort.setStrategy(strategy: DateSortStrategy())
            self.viewModelsCurrent = Sort.executeStrategy(viewModels: self.viewModelsCurrent as! [LaunchViewModel])
            self.viewModelsOriginal = self.viewModelsCurrent
        })
        alertController.addAction(UIAlertAction(title: Constant.LaunchScreen.NavigationItemButton.name, style: .default) { [weak self] _ in
            guard let self else { return }
            Sort.setStrategy(strategy: NameSortStrategy())
            self.viewModelsCurrent = Sort.executeStrategy(viewModels: self.viewModelsCurrent as! [LaunchViewModel])
            self.viewModelsOriginal = self.viewModelsCurrent
        })
        
        alertController.view.tintColor = .orange
        present(alertController, animated: true)
    }
    
    @objc private func launchRefreshButtonPressed() {
        manager.update()
    }
}

// MARK: - WebManagerDelegate

extension LaunchScreenTableViewController: WebManagerDelegate {
    func didUpdate(viewModels: [ViewModel]?, text: String, messageStatus: MessageStatusOption) {
        Task {
            if let viewModels,
               messageStatus == .normal {
                viewModelsOriginal = viewModels
                viewModelsCurrent = viewModels
                resetViewModelCurrent()
            }
            
            messageAnimation.message(text, messageStatus: messageStatus)
            try? await messageAnimationTitleView()
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
        if !searchText.isEmpty {
            Filter.setStrategy(strategy: NameFilterStrategy())
            viewModelsCurrent = Filter.executeStrategy(viewModels: viewModelsOriginal as! [LaunchViewModel], text: searchText)
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
