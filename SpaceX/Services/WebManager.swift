//
//  WebManager.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 04.04.2023.
//

import Foundation

/// Responsibility to delegate the fetched view models
final class WebManager {
    var delegate: WebManagerDelegate?
    
    /// Updating the view models
    func update() {
        Task(priority: .background) {
            do {
                let launchViewModels = try await ServiceFactory.create().fetch(resourceName: Constant.URL.spaceX)
                delegate?.update(viewModels: launchViewModels)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
