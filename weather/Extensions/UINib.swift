//
//  UINib.swift
//  weather
//

import UIKit

public enum UITableViewCellType: String {
    case forecastTableViewCell = "ForecastTableViewCell"
}

extension UINib {
    convenience public init(_ cellType: UITableViewCellType) {
        self.init(nibName: cellType.rawValue, bundle: nil)
    }
}
