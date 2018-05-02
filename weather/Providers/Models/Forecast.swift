//
//  Forecast.swift
//  weather
//

import Foundation

struct Forecast: Codable {
    let highTemperature: Double
    let lowTemperature: Double
    let iconName: String
    let weekday: String

    enum CodingKeys: String, CodingKey {
        case highTemperature
        case lowTemperature
        case iconName
        case weekday
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        highTemperature = try Double(values.decode(String.self, forKey: .highTemperature))!
        lowTemperature = try Double(values.decode(String.self, forKey: .lowTemperature))!
        iconName = try values.decode(String.self, forKey: .iconName)
        weekday = try values.decode(String.self, forKey: .weekday)
    }
}
