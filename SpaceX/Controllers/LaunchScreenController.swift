//
//  ViewController.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 01.04.2023.
//

import SwiftUI

/// Reponsible for showing all past SpaceX launches
final class LaunchScreenTableViewController: UITableViewController {
    private var launchViewModels: [ViewModel] = []
    private var webManager: WebManager = WebManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constant.LaunchScreen.Title.name
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constant.LaunchScreen.Cell.identifier)
        webManager.delegate = self
        webManager.update()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        launchViewModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let launchViewModel = launchViewModels[indexPath.row] as! LaunchViewModel
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.LaunchScreen.Cell.identifier, for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.contentConfiguration = UIHostingConfiguration { LaunchCellView(launchViewModel: launchViewModel) }
        return cell
    }
}

extension LaunchScreenTableViewController: WebManagerDelegate {
    func update(viewModels: [ViewModel]) {
        Task {
            launchViewModels = viewModels
            tableView.reloadData()
        }
    }
}

