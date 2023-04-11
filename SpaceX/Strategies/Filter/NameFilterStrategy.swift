//
//  NameFilterStrategy.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 08.04.2023.
//

/// Responsible for filtering the content by name
final class NameFilterStrategy: FilterStrategy {
    func execute(viewModels: [ViewModel], text: String) -> [ViewModel] {
        let launchViewModels = viewModels as! [LaunchViewModel]
        let filteredTitle = launchViewModels.map { $0.title }.enumerated().filter({ $0.element.localizedCaseInsensitiveContains(text) })
        return filteredTitle.map { launchViewModels[$0.offset] }
    }
}
