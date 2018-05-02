//
//  ForecastTableViewCell.swift
//  weather
//

import UIKit

protocol ForecastTableViewCellProtocol {
    func configure(with forecast: Forecast)
}

typealias ForecastTableViewCellType = ForecastTableViewCellProtocol & UITableViewCell

class ForecastTableViewCell: ForecastTableViewCellType {

    @IBOutlet weak var weekdayLabel: UILabel!
    @IBOutlet weak var highTemperatureLabel: UILabel!
    @IBOutlet weak var lowTemperatureLabel: UILabel!

    func configure(with forecast: Forecast) {
        weekdayLabel.text = forecast.weekday
        highTemperatureLabel.text = forecast.highTemperature.temperature
        lowTemperatureLabel.text = forecast.lowTemperature.temperature
    }
}
