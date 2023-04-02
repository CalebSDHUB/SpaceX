//
//  MockService.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 02.04.2023.
//

/// Simulating the webservice
final class MockWebservice: Service {
    static let shared: MockWebservice = MockWebservice()
    private init() {}
    
    func fetch(resourceName: String) async throws -> [LaunchViewModel]? {
            try await Task.sleep(for: Duration.milliseconds(2000))
            guard let launchModels = try File.readJSON(type: [LaunchModel].self, resourceName: Constant.File.ResourceName.spaceXLaunch) else { throw FileError.readJSONFileFailure }
            return launchModels.map(LaunchViewModel.init)
    }
}
