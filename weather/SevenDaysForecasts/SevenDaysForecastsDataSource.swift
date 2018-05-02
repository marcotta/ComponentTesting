//
//  SevenDaysForecastsTableViewDataSource.swift
//  weather
//

import UIKit

protocol SevenDaysForecastsDataSourceProtocol {
    var city: String { get }
    var forecasts: DailyForecasts { get }
}

typealias SevenDaysForecastsDataSourceType = NSObject & UITableViewDataSource & SevenDaysForecastsDataSourceProtocol

class SevenDaysForecastsDataSource: SevenDaysForecastsDataSourceType {
    var city: String {
        return forecasts.forecastLocation.city
    }
    let forecasts: DailyForecasts

    init(forecasts: DailyForecasts) {
        self.forecasts = forecasts
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecasts.forecastLocation.forecast.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.tableView(tableView as ReusableCellDequeuing, cellForRowAt: indexPath)
    }

    func tableView(_ tableView: ReusableCellDequeuing, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = UITableViewCellType.forecastTableViewCell.rawValue

        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? ForecastTableViewCellType else {
            fatalError("Nib \(cellIdentifier) not registered")
        }

        let forecast = forecasts.forecastLocation.forecast[indexPath.row]
        cell.configure(with: forecast)

        return cell
    }
}
