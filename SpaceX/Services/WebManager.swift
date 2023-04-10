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
                let viewModels = try await ServiceFactory.create().fetch()
                delegate?.didUpdate(viewModels: viewModels, text: Constant.WebManagerDelegate.updated, messageStatus: .normal)
            } catch {
                delegate?.didUpdate(viewModels: nil, text: error.localizedDescription, messageStatus: .warning)
            }
        }
    }
}
