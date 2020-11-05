//
//  DetailWeatherVC.swift
//  WeatherProject
//
//  Created by Pursuit on 10/17/19.
//  Copyright © 2019 Neema Philippe. All rights reserved.
//

import UIKit

class DetailWeatherVC: UIViewController {
    
    lazy var cityImageView: UIImageView = {
           
          let imageview = UIImageView()
           imageview.contentMode = .scaleAspectFit
           imageview.backgroundColor = .lightGray
           return imageview
           
       }()
       
       lazy var cityNameLabel: UILabel = {
           let label = UILabel()
           label.textAlignment = .center
           return label
       }()
       
       
       lazy var dateLabel: UILabel = {
           let label = UILabel()
           label.textAlignment = .center
           return label
       }()
    
        lazy var descriptionLabel: UILabel = {
            let label = UILabel()
            label.textAlignment = .center
            return label
        }()
    
    var selectedForecast: WeatherForecast!
    var name: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        constrainDetailImageView()
        configureStackView()
        

        
    }
    

    

//MARK: Constraint Functions

private func constrainDetailImageView(){
    view.addSubview(cityImageView)
    cityImageView.translatesAutoresizingMaskIntoConstraints = false
    cityImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
    cityImageView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.4).isActive = true
    cityImageView.widthAnchor.constraint(equalTo: cityImageView.heightAnchor, multiplier: 0.75).isActive = true
    cityImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
}
    
private func configureStackView(){
    let stackView = UIStackView(arrangedSubviews: [cityNameLabel,dateLabel, descriptionLabel])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .leading
    
        view.addSubview(stackView)
    
    stackView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
        stackView.topAnchor.constraint(equalToSystemSpacingBelow: cityImageView.bottomAnchor, multiplier: 10),
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
        stackView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
        stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
    
    ])
         
       }
}
