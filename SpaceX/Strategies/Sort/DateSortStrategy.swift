//
//  NewestAlertActionStrategy.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 07.04.2023.
//

final class DateSortStrategy: SortStrategy {
    func execute(viewModels: [ViewModel]) -> [ViewModel] {
        let launchViewModels = viewModels as! [LaunchViewModel]
        let sortedDates = launchViewModels.map { $0.launchDate }.enumerated().sorted(by: { $0 > $1 })
        return sortedDates.map { launchViewModels[$0.offset] }
    }
}
