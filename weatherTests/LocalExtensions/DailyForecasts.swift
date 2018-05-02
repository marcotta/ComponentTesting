//
//  DailyForecasts.swift
//  weatherTests
//

import Foundation

@testable import weather

extension DailyForecasts: Equatable {
    public static func == (lhs: DailyForecasts, rhs: DailyForecasts) -> Bool {
        return lhs.forecastLocation == rhs.forecastLocation
    }
}
