//
//  ViewController.swift
//  WeatherProject
//
//  Created by Pursuit on 10/17/19.
//  Copyright © 2019 Neema Philippe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var weatherCollectionView: UICollectionView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var zipcodeInputText: UITextField!
    
    var weatherForecast = [WeatherForecast]() {
        didSet {
        
            weatherCollectionView.reloadData()
        }
    }
    
    private var zipCode : String? {
        didSet{
            getLatandLong()
        }
    }

    private var longitude: Double?
    
    private var latitude: Double?
    
    private var name: String? {
        didSet{
            locationLabel.text = "Weekly forecast for \(name ?? "")"
        }
    }
    
    private func getLatandLong(){
        ZipCodeHelper.getLatLongAndName(fromZipCode: zipCode!) { (result) in
            switch result {
            case .success(let zipCodeData):
                self.longitude = zipCodeData.long
                print("Longitude: \(self.longitude)")
                self.latitude = zipCodeData.lat
                print("Latitude: \(self.latitude)")
                self.name = zipCodeData.name
               self.loadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func loadData(){
        WeatherAPIClient.shared.getWeatherFrom(latitude: latitude ?? 1234567890, longitude: longitude ?? 1234567890) { (result) in
            switch result {
            case .success(let weatherData):
                self.weatherForecast = weatherData
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        zipcodeInputText.delegate = self
        weatherCollectionView.dataSource = self
        weatherCollectionView.delegate = self
        view.backgroundColor = .lightGray
       
    }


}
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        zipCode = textField.text!
    
        return true
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weatherForecast.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "weatherCell", for: indexPath) as! WeatherCell
        let specificWeather = weatherForecast[indexPath.row]
        cell.temperatureHighLabel.text = "Temperature High: \(specificWeather.temperatureHigh)"
        
        cell.temperatureLowLabel.text = "Temperature Low: \(specificWeather.temperatureLow)"
        
        cell.forecastImage.image = UIImage(named: "\(specificWeather.icon)")
        
        return cell
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: 160)
    }
}
