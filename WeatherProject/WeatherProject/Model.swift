//
//  Model.swift
//  WeatherProject
//
//  Created by Pursuit on 10/19/19.
//  Copyright © 2019 Neema Philippe. All rights reserved.
//

import Foundation

struct WeatherModel: Codable {
    let daily: Weather
}

struct Weather: Codable {
    let data: [WeatherForecast]
}

struct WeatherForecast: Codable {
    let icon: String
    let temperatureHigh: Double
    let temperatureLow: Double
    let windSpeed: Double
    let precipIntensityMax: Double
    let time: Int
    let sunriseTime: Int
    let sunsetTime: Int
}

