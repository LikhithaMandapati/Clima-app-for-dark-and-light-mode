//
//  WeatherManager.swift
//  Clima
//
//  Created by Likhitha Mandapati on 3/1/24.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatheManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=af83b9a23a5f9544ffcb0ba98a7d846c&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName : String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(with: urlString)
    }
    
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        
        if let url = URL(string: urlString) {   // 1. Create a url
            let session = URLSession(configuration: .default)  // 2. Create a url session
            let task = session.dataTask(with: url) { data, response, error in // 3. Give the session a task
                if error != nil {
                    delegate?.didFailWithError(error: error!)
                }
                if let safeData = data {
                    if let weather = self.parseJSON(safeData) {
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            task.resume()  // 4. Start the task
        }
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            let weatherModel = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            print(temp)
            print(name)
            return weatherModel
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
