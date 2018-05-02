//
//  SevenDaysForecastsViewController.swift
//  weather
//

import UIKit

class SevenDaysForecastsViewController: UIViewController {
    var dataSource: SevenDaysForecastsDataSourceType?

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = dataSource
        tableView.register(.forecastTableViewCell)

        locationLabel.text = dataSource?.city
    }
}
