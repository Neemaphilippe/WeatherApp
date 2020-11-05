//
//  WeatherAPIClient.swift
//  WeatherProject
//
//  Created by Pursuit on 10/19/19.
//  Copyright © 2019 Neema Philippe. All rights reserved.
//

import Foundation
struct WeatherAPIClient {
    private init() {}
    static let shared = WeatherAPIClient()
    
    func getWeatherFrom(latitude: Double, longitude: Double, completionHandler: @escaping (Result<[WeatherForecast], AppError>) -> ()) {
        let urlStr = "https://api.darksky.net/forecast/2c32df52d290b9a521639872264dc347/\(latitude),\(longitude)"
        
        guard let url = URL(string: urlStr) else {
            completionHandler(.failure(AppError.badURL))
            return
        }
        
        NetworkHelper.manager.performDataTask(withUrl: url, andMethod: .get) { (result) in
            switch result {
            case .failure(let error):
                completionHandler(.failure(.other(rawError: error)))
            case .success(let data):
                do {
                    let weatherArr = try JSONDecoder().decode(Weather.self, from: data)
                    completionHandler(.success(weatherArr.daily.data))
                }
                catch {
                    completionHandler(.failure(.other(rawError: error)))
                }
                
            }
        }
    }
    
}



