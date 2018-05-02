//
//  DailyForecasts.swift
//  weather
//

import Foundation

struct DailyForecasts: Codable {
    let forecastLocation: ForecastLocation

	enum CodingKeys: String, CodingKey {
		case forecastLocation
	}

    init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		forecastLocation = try values.decode(ForecastLocation.self, forKey: .forecastLocation)
	}
}
