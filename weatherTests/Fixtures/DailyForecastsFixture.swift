//
//  DailyForecastsFixture.swift
//  weatherTests
//

import Foundation

@testable import weather

class DailyFoorecastsFixture {

    static func DailyForecastsItem() -> DailyForecasts {
        return try! JSONDecoder().decode(DailyForecasts.self, from: HereWeatherResponseDataFixture.DailyForecastsData())
    }

    static func ForecastItem() -> Forecast {
        return try! JSONDecoder().decode(Forecast.self, from: HereWeatherResponseDataFixture.ForecastData())
    }
}
