//
//  SevenDaysWeatherForecastProvider.swift
//  weather
//

typealias ForecastCompletionHandler = ((DailyForecasts?, Error?) -> Void)?

protocol SevenDaysWeatherForecastProvider {
	func findForecast(with city: String, completion: ForecastCompletionHandler)
}
