//
//  WeatherPersistenceHelper.swift
//  WeatherProject
//
//  Created by Pursuit on 10/19/19.
//  Copyright © 2019 Neema Philippe. All rights reserved.
//

import Foundation
struct WeatherPersistenceManager {
private init() {}
static let manager = WeatherPersistenceManager()
 private let persistenceHelper = PersistenceHelper<Weather>(fileName: "weather.plist")
    //save image
}
