//
//  SuccessStrategy.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 07.04.2023.
//

final class SuccessStrategy: Strategy {
    func execute(viewModels: [ViewModel]) -> [ViewModel] {
        let launchViewModels = viewModels as! [LaunchViewModel]
        let filteredSuccess = launchViewModels.map({ $0.launchSuccess }).enumerated().filter({ $0.element == true })
        return filteredSuccess.map { launchViewModels[$0.offset] }
    }
}
