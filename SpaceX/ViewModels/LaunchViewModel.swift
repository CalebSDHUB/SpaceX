//
//  LaunchViewModel.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 02.04.2023.
//

import Foundation

struct LaunchViewModel {
    private let launchModel: LaunchModel

    init(launchModel: LaunchModel) {
        self.launchModel = launchModel
    }

    var id: String { launchModel.id }
    var imageLogo: String { launchModel.links?.patch?.small ?? "n/a"}
    var videoURL: String {  launchModel.links?.webcast ?? "n/a" }
    var articleURL: String { launchModel.links?.article ?? "n/a" }
    var wikipediaURL: String { launchModel.links?.wikipedia ?? "n/a" }
    var launchDate: String { Date.unix(launchModel.staticFireDateUnix ?? -1) }
    var launchSuccess: Bool { launchModel.success ?? false }
    var failureReasons: [String] { launchModel.failures.map({ $0?.reason ?? "n/a" }) }
    var failureDetails: String { launchModel.details ?? "n/a" }
}
