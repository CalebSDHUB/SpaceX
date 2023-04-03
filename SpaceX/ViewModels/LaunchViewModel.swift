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
    var name: String { launchModel.name ?? Constant.String.default }
    var imageLogo: String { launchModel.links?.patch?.small ?? Constant.String.default }
    var videoURL: String {  launchModel.links?.webcast ?? Constant.String.default }
    var articleURL: String { launchModel.links?.article ?? Constant.String.default }
    var wikipediaURL: String { launchModel.links?.wikipedia ?? Constant.String.default }
    var LaunchDate: String { Date.utc(launchModel.dateUTC ?? Constant.String.default) ?? Constant.String.default }
    var launchSuccess: Bool { launchModel.success ?? false }
    var failureReasons: [String] { launchModel.failures.map({ $0?.reason ?? Constant.String.default }) }
    var failureDetails: String { launchModel.details ?? Constant.String.default }
}
