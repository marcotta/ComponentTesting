//
//  FakeSevenDaysWeatherForecastProvider.swift
//  weatherTests
//

@testable import weather

class FakeSevenDaysWeatherForecastProvider: SevenDaysWeatherForecastProvider {
	private(set) var city = ""
	private(set) var findForecastAttempted = false
	var dailyForecastsToReturn: DailyForecasts?
	var errorToReturn: Error?

	func findForecast(with city: String, completion: ForecastCompletionHandler) {
		self.city = city
		findForecastAttempted = true
		completion?(dailyForecastsToReturn, errorToReturn)
	}
}
