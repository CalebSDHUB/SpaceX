//
//  WebService.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 02.04.2023.
//

import Foundation

final class Webservice: Service {
    func fetch() {
        Task {
            let data = await HTTP.requestResponse("https://api.spacexdata.com/v5/launches", statusCode: 200)
            print(data)
        }
    }
}
