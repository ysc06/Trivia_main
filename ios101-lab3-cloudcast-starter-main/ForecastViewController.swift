//
//  ForecastViewController.swift
//  CloudCast
//
//  Created by Yu-Shan Cheng on 6/30/25.
//

import UIKit

class ForecastViewController: UIViewController {
    @IBOutlet weak var forecastImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBAction func didTapForwardButton(_ sender: UIButton) {
        selectedForecastIndex = min(forecasts.count - 1, selectedForecastIndex + 1) // don't go higher than the number of forecasts
        configure(with: forecasts[selectedForecastIndex]) // change the forecast shown in the UI
        }
    @IBAction func didTapBackButton(_ sender: UIButton) {
        selectedForecastIndex = max(0, selectedForecastIndex - 1) // don't go lower than 0 index
         configure(with: forecasts[selectedForecastIndex]) // change the forecast shown in the UI
    }
    
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
   
    @IBOutlet weak var LocationLabel: UILabel!
    var forecasts: [WeatherForecast] = []
    var selectedForecastIndex: Int = 0
    override func viewDidLoad() {
            super.viewDidLoad()
            forecasts = createMockData()
            configure(with: forecasts[selectedForecastIndex]) // configure the UI to show the first mock data
        }
        // Returns an array of fake WeatherForecast data models to show
        private func createMockData() -> [WeatherForecast] {
            // This is just using the Calendar API to get a few random dates
            let today = Date()
            var dateComponents = DateComponents()
            dateComponents.day = 1
            let tomorrow = Calendar.current.date(byAdding: dateComponents, to: today)!
            let dayAfterTomorrow = Calendar.current.date(byAdding: dateComponents, to: tomorrow)!
            // Create a few mock data to show
            let mockData1 = WeatherForecast(windSpeed: 3.3,
                                            weatherCode: .violentRainShowers,
                                            precipitation: 33.3,
                                            temperature: 59.5,
                                            date:today)
            let mockData2 = WeatherForecast(windSpeed: 3.7,
                                            weatherCode: .fog,
                                            precipitation: 13.3,
                                            temperature: 65.5,
                                            date: tomorrow)
            let mockData3 = WeatherForecast(windSpeed: 2.8,
                                            weatherCode: .partlyCloudy,
                                            precipitation: 23.3,
                                            temperature: 49.5,
                                            date: dayAfterTomorrow)
            return [mockData1, mockData2, mockData3]
        }
      private func configure(with forecast: WeatherForecast) {
        forecastImageView.image = forecast.weatherCode.image
        descriptionLabel.text = forecast.weatherCode.description
        temperatureLabel.text = "\(forecast.temperature)°F"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d, yyyy"
        dateLabel.text = dateFormatter.string(from: forecast.date)
      }
    }
