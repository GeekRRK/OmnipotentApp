//
//  ViewController.swift
//  SwiftLearning
//
//  Created by Al on 6/17/17.
//  Copyright © 2017 GeekRRK. All rights reserved.
//

import UIKit
import WeatherKit

class ViewController: UIViewController {

    @IBOutlet weak var cityLabel:UILabel!
    @IBOutlet weak var countryLabel:UILabel!
    @IBOutlet weak var weatherLabel:UILabel!
    @IBOutlet weak var temperatureLabel:UILabel!
    
    var city = "San Francisco"
    var country = "U.S."
    
    override func viewDidLoad() {
        super.viewDidLoad()

        weatherLabel.text = ""
        temperatureLabel.text = ""
        
        displayCurrentWeather()
    }
    
    func displayCurrentWeather() {
        cityLabel.text = city
        countryLabel.text = country
        
        WeatherService.sharedWeatherService().getCurrentWeather(city + "," + country, completion: { (data) -> () in
            OperationQueue.main.addOperation({ () -> Void in
                if let weatherData = data {
                    self.weatherLabel.text = weatherData.weather.capitalized
                    self.temperatureLabel.text = String(format: "%d", weatherData.temperature) + "\u{0080}"
                }
            })
        })
    }

}
