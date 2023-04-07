//
//  FailureStrategy.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 07.04.2023.
//

final class FailureStrategy: Strategy {
    func execute(viewModels: [ViewModel]) -> [ViewModel] {
        let launchViewModels = viewModels as! [LaunchViewModel]
        let filteredFailures = launchViewModels.map({ $0.launchSuccess }).enumerated().filter({ $0.element == false })
        return filteredFailures.map { launchViewModels[$0.offset] }
    }
}
