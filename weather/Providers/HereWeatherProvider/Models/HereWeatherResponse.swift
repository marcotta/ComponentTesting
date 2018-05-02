//
//  HereWeatherResponse.swift
//  weather
//

import Foundation

struct HereWeatherResponse: Codable {
	let dailyForecasts: DailyForecasts

    enum CodingKeys: String, CodingKey {
		case dailyForecasts
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		dailyForecasts = try values.decode(DailyForecasts.self, forKey: .dailyForecasts)
	}
}
