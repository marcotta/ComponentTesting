//
//  FakeForecastTableViewCell.swift
//  weatherTests
//

import Foundation

@testable import weather

class FakeForecastTableViewCell: ForecastTableViewCellType {

    public private (set) var lastConfiguredForecats: Forecast?

    func configure(with forecast: Forecast) {
        lastConfiguredForecats = forecast
    }
}
