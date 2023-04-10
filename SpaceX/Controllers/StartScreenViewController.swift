//
//  StartScreenViewController.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 10.04.2023.
//

import UIKit

class StartScreenViewController: UIViewController {
    private lazy var backgroundImageView: UIImageView = {
        let backgroundImageView = UIImageView(image: UIImage(named: Constant.BackgroundImage.name))
        backgroundImageView.contentMode = .scaleAspectFill
        return backgroundImageView
    }()
    
    private lazy var labelSpaceX: UILabel = {
        let label = UILabel()
        label.text = "SPACEX"
        label.font = UIFont.systemFont(ofSize: 50, weight: .bold)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addConstraints()
        switchScreen()
    }
    
    private func addConstraints() {
        view.addSubview(backgroundImageView)
        view.addSubview(labelSpaceX)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        labelSpaceX.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            labelSpaceX.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelSpaceX.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 200)
        ])
    }
    
    private func switchScreen() {
        Task {
            try await Task.sleep(for: Duration.milliseconds(3000))
            navigationController?.setViewControllers([LaunchScreenTableViewController()], animated: true)
        }
    }
}
