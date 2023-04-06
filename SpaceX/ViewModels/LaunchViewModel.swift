//
//  LaunchViewModel.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 02.04.2023.
//

import Foundation

struct LaunchViewModel: ViewModel {
    private let launchModel: LaunchModel

    init(launchModel: LaunchModel) {
        self.launchModel = launchModel
    }

    var id: String { launchModel.id }
    var title: String { launchModel.name ?? Constant.Default.string }
    var imageLogo: String { launchModel.links?.patch?.small ?? Constant.Default.string }
    var videoURL: String {  launchModel.links?.webcast ?? Constant.Default.string }
    var articleURL: String { launchModel.links?.article ?? Constant.Default.string }
    var wikipediaURL: String { launchModel.links?.wikipedia ?? Constant.Default.string }
    var launchSuccess: Bool { launchModel.success ?? false }
    var failureReasons: [String] { launchModel.failures.map({ $0?.reason ?? Constant.Default.string }) }
    var failureDetail: String { launchModel.details ?? Constant.Default.string }
    var launchDate: String? { launchModel.dateUTC }
    var launchDateShort: String {
        Date.utc(launchModel.dateUTC ?? Constant.Default.string,
                 dateStyle: .abbreviated,
                 timeStyle: .omitted) ?? Constant.Default.string }
    var launchDateLong: String {
        Date.utc(launchModel.dateUTC ?? Constant.Default.string,
                 dateStyle: .abbreviated,
                 timeStyle: .complete) ?? Constant.Default.string }
}
