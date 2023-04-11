//
//  TitleStrategy.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 07.04.2023.
//

/// Responsible for sorting the content by date
final class NameSortStrategy: SortStrategy {
    func execute(viewModels: [ViewModel]) -> [ViewModel] {
        let launchViewModels = viewModels as! [LaunchViewModel]
        let sortedTitle = launchViewModels.map { $0.title }.enumerated().sorted(by: { $0 > $1 })
        return sortedTitle.map { launchViewModels[$0.offset] }
    }
}
