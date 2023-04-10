//
//  MockService.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 02.04.2023.
//

/// Responsible for simulating the webservice
final class MockWebservice: Service {
    static let shared: MockWebservice = MockWebservice()
    private init() {}
    
    func fetch(resourceName: String) async throws -> [ViewModel] {
            try await Task.sleep(for: Duration.milliseconds(200))
            let launchModels = try File.readJSON(type: [LaunchModel].self, resourceName: resourceName)
            return launchModels.map(LaunchViewModel.init)
    }
}
