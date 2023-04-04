//
//  WebManager.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 04.04.2023.
//

import Foundation

/// Responsibility to delegate the fetched view models
final class WebManager: Manager {
    var delegate: WebManagerDelegate?
    static let shared = WebManager()
    private init() {}
    
    /// Updating the view models
    func update() {
        Task(priority: .background) {
            do {
                let viewModels = try await ServiceFactory.create().fetch(resourceName: Constant.URL.spaceX)
                delegate?.update(viewModels: viewModels)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
