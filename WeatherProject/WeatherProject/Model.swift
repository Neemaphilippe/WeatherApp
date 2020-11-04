//
//  Model.swift
//  WeatherProject
//
//  Created by Pursuit on 10/19/19.
//  Copyright © 2019 Neema Philippe. All rights reserved.
//

import Foundation

struct Weather: Codable {
    let daily: WeatherDaily
}

struct WeatherDaily: Codable {
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

