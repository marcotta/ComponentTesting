//
//  ForecastLocation.swift
//  weatherTests
//

import Foundation

@testable import weather

extension ForecastLocation: Equatable {
    public static func == (lhs: ForecastLocation, rhs: ForecastLocation) -> Bool {
        return lhs.forecast == rhs.forecast &&
            lhs.city == rhs.city &&
            lhs.latitude == rhs.latitude &&
            lhs.longitude == rhs.longitude
    }
}
