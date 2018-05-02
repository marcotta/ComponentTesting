//
//  Forecast.swift
//  weatherTests
//

import Foundation

@testable import weather

extension Forecast: Equatable {
    public static func == (lhs: Forecast, rhs: Forecast) -> Bool {
        return lhs.highTemperature == rhs.highTemperature &&
            lhs.lowTemperature == rhs.lowTemperature &&
            lhs.iconName == rhs.iconName &&
            lhs.weekday == rhs.weekday
    }
}
