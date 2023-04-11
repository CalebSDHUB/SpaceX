//
//  MockService.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 02.04.2023.
//

/// Responsible for simulating the webservice
final class MockWebservice: Service {
    static let shared: MockWebservice = MockWebservice()
    var fetchCount: Int = 0
    private init() {}
    
    /// Fetching JSON from file
    func fetch(resourceName: String) async throws -> [ViewModel] {
        try await Task.sleep(for: Duration.milliseconds(200))
        let launchModels = try File.readJSON(type: [LaunchModel].self, resourceName: resourceName)
        fetchCount += 1
        return launchModels.map(LaunchViewModel.init)
    }
}
