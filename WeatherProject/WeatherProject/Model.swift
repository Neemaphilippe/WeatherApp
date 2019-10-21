//
//  Model.swift
//  WeatherProject
//
//  Created by Pursuit on 10/19/19.
//  Copyright © 2019 Neema Philippe. All rights reserved.
//

import Foundation

struct WeatherResultsWrapper: Codable {
    let results: [Weather]
    
    static func getWeatherFromData(data: Data) throws ->  [Weather] {
        var weatherArr = [Weather]()
        do {
            let info = try JSONDecoder().decode(WeatherResultsWrapper.self, from: data)
            weatherArr = info.results
            
        } catch {
            print(error)
        }
        return weatherArr
    }
    
}

struct Weather: Codable {
    let latitude, longitude: Double
    let timezone: String
    let currently: CurrentWeather
    let minutely: Minutely
    let hourly: Hourly
    let daily: Daily
}

struct CurrentWeather: Codable {
    let time: Int
    let summary: Summary
    let icon: Icon
    let nearestStormDistance, nearestStormBearing: Int?
    let precipIntensity, precipProbability, temperature, apparentTemperature: Double
    let dewPoint, humidity, pressure, windSpeed: Double
    let windGust: Double
    let windBearing: Int
    let cloudCover: Double
    let uvIndex: Int
    let visibility, ozone: Double
    let precipType: PrecipType?
}

enum Icon: String, Codable {
    case clearDay = "clear-day"
    case clearNight = "clear-night"
    case cloudy = "cloudy"
    case partlyCloudyDay = "partly-cloudy-day"
    case partlyCloudyNight = "partly-cloudy-night"
}

enum PrecipType: String, Codable {
    case rain = "rain"
}

enum Summary: String, Codable {
    case clear = "Clear"
    case mostlyCloudy = "Mostly Cloudy"
    case overcast = "Overcast"
    case partlyCloudy = "Partly Cloudy"
}

struct Daily: Codable {
    let summary: String
    let icon: Icon
    let data: [DailyInfo]
}


struct DailyInfo: Codable {
    let time: Int
    let summary: String
    let icon: Icon
    let sunriseTime, sunsetTime: Int
    let moonPhase, precipIntensity, precipIntensityMax: Double
    let precipIntensityMaxTime: Int
    let precipProbability: Double
    let precipType: PrecipType?
    let temperatureHigh: Double
    let temperatureHighTime: Int
    let temperatureLow: Double
    let temperatureLowTime: Int
    let apparentTemperatureHigh: Double
    let apparentTemperatureHighTime: Int
    let apparentTemperatureLow: Double
    let apparentTemperatureLowTime: Int
    let dewPoint, humidity, pressure, windSpeed: Double
    let windGust: Double
    let windGustTime, windBearing: Int
    let cloudCover: Double
    let uvIndex, uvIndexTime: Int
    let visibility, ozone, temperatureMin: Double
    let temperatureMinTime: Int
    let temperatureMax: Double
    let temperatureMaxTime: Int
    let apparentTemperatureMin: Double
    let apparentTemperatureMinTime: Int
    let apparentTemperatureMax: Double
    let apparentTemperatureMaxTime: Int
}


struct Hourly: Codable {
    let summary: String
    let icon: Icon
    let data: [CurrentWeather]
}

struct Minutely: Codable {
    let summary: String
    let icon: Icon
    let data: [MinutelyInfo]
}


struct MinutelyInfo: Codable {
    let time: Int
    let precipIntensity, precipProbability: Double
    let precipIntensityError: Double?
    let precipType: PrecipType?
}
