//
//  UITableView.swift
//  weather
//

import UIKit

protocol ReusableCellDequeuing {
    func dequeueReusableCell(withIdentifier identifier: String) -> UITableViewCell?
    func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell
}

extension UITableView: ReusableCellDequeuing { }

extension UITableView {
    func register(_ cellType: UITableViewCellType) {
        return self.register(UINib(cellType), forCellReuseIdentifier: cellType.rawValue)
    }
}
