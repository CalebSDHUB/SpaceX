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
            let launchViewModels = await Webservice.shared.fetch(resourceName: Constant.URL.spaceX)
            print(launchViewModels.count)
        }
    }
}

