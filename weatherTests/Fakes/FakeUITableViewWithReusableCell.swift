//
//  FakeUITableView.swift
//  weatherTests
//

import UIKit

@testable import weather

class FakeUITableView: ReusableCellDequeuing {

    let reusableCell: UITableViewCell

    init(withReusableCell reusableCell: UITableViewCell) {
        self.reusableCell = reusableCell
    }

    func dequeueReusableCell(withIdentifier identifier: String) -> UITableViewCell? {
        return reusableCell
    }

    func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
        return reusableCell
    }
}
