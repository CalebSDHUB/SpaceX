//
//  ViewController.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 01.04.2023.
//

import SwiftUI

/// Reponsible for showing all past SpaceX launches
final class LaunchScreenTableViewController: UITableViewController {
    private var launchViewModels: [LaunchViewModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constant.LaunchScreen.Title.name
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constant.LaunchScreen.Cell.identifier)
        Task {
            await populate()
            tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        launchViewModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let launchViewModel = launchViewModels[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.LaunchScreen.Cell.identifier, for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.contentConfiguration = UIHostingConfiguration { LaunchCellView(launchViewModel: launchViewModel) }
        return cell
    }
    
    private func populate() async {
        do {
            launchViewModels = try await ServiceFactory.create().fetch(resourceName: Constant.URL.spaceX)
        } catch {
            print(error.localizedDescription)
        }
    }
}

