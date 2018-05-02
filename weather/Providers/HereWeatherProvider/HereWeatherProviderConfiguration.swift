//
//  HereWeatherProviderConfiguration.swift
//  weather
//

import Foundation

struct HereWeatherProviderConfiguration {
    let scheme = "https"
    let host = "weather.cit.api.here.com"
    let path = "/weather/1.0/report.json"
    let appId: String
    let appCode: String

    init(appId: String? = "Get one from https://developer.here.com",
         appCode: String? = "Get one from https://developer.here.com") {
        self.appId = appId!
        self.appCode = appCode!
    }
}
