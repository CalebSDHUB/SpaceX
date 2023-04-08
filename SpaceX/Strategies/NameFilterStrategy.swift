//
//  NameFilterStrategy.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 08.04.2023.
//

//final class NameFilterStrategy: Strategy {
//    func execute(viewModels: [ViewModel]) -> [ViewModel] {
//        let launchViewModels = viewModels as! [LaunchViewModel]
//        let filteredTitle = launchViewModels.map { $0.title }.enumerated().filter({ $0.element.localizedCaseInsensitiveContains(searchText) })
//        return filteredTitle.map { launchViewModels[$0.offset] }
//    }
//}
