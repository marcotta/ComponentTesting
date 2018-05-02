//
//  ForecastLocation.swift
//  weather
//

import Foundation

struct ForecastLocation: Codable {
    let forecast: [Forecast]
	let city: String
	let latitude: Double
	let longitude: Double

	enum CodingKeys: String, CodingKey {
		case forecast
		case city
		case latitude
		case longitude
    }

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
        forecast = try values.decode([Forecast].self, forKey: .forecast)
		city = try values.decode(String.self, forKey: .city)
		latitude = try values.decode(Double.self, forKey: .latitude)
		longitude = try values.decode(Double.self, forKey: .longitude)
	}
}
