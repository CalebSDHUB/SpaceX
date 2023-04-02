//
//  ViewController.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 01.04.2023.
//

import UIKit

final class LaunchScreenController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        Task {
            do {
                let launchViewModels = try await ServiceFactory.create().fetch(resourceName: Constant.URL.spaceX)
                print(launchViewModels.first?.failureReasons)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

