//
//  FakeSevenDaysForecastsDataSource.swift
//  weatherTests
//

import UIKit

@testable import weather

class FakeSevenDaysForecastsDataSource: SevenDaysForecastsDataSourceType {

    var forecasts: DailyForecasts
    var city: String {
        return forecasts.forecastLocation.city
    }

    init(forecasts: DailyForecasts) {
        self.forecasts = forecasts
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fatalError("Not implemented")
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        fatalError("Not implemented")
    }
}
