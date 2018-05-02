//
//  DataFixture.swift
//  weatherTests
//

import Foundation

class HereWeatherResponseDataFixture {
    
    static func HereWeatherResponseData() -> Data {
        return """
            {
                "dailyForecasts":
                {
                    "forecastLocation":
                    {
                        "forecast": [{
                                        "highTemperature": "20.00",
                                        "lowTemperature": "8.10",
                                        "iconName": "sunny",
                                        "weekday": "Monday"
                                     },
                                     {
                                        "highTemperature": "20.00",
                                        "lowTemperature": "8.10",
                                        "iconName": "sunny",
                                        "weekday": "Tuesday"
                                     }],
                        "city": "Chicago",
                        "latitude": 10,
                        "longitude": 20
                    }
                }
            }
            """.data(using: String.Encoding.utf8)!
    }
    
    static func DailyForecastsData() -> Data {
        return """
            {
                "forecastLocation":
                {
                    "forecast": [{
                                    "highTemperature": "20.00",
                                    "lowTemperature": "8.10",
                                    "iconName": "sunny",
                                    "weekday": "Monday"
                                 },
                                 {
                                    "highTemperature": "20.00",
                                    "lowTemperature": "8.10",
                                    "iconName": "sunny",
                                    "weekday": "Tuesday"
                                 }],
                    "city": "Chicago",
                    "latitude": 10,
                    "longitude": 20
                }
            }
            """.data(using: String.Encoding.utf8)!
    }
    
    static func InvalidDailyForecastsData() -> Data {
        //forecastLocation is missing
        return """
            {
                "dailyForecasts":
                {
                }
            }
            """.data(using: String.Encoding.utf8)!
    }
    
    static func ForecastLocationData() -> Data {
        return """
            {
                "forecast": [{
                    "highTemperature": "20.00",
                    "lowTemperature": "8.10",
                    "iconName": "sunny",
                    "weekday": "Monday"
                    },
                    {
                    "highTemperature": "20.00",
                    "lowTemperature": "8.10",
                    "iconName": "sunny",
                    "weekday": "Tuesday"
                    }],
                    "city": "Chicago",
                    "latitude": 10,
                    "longitude": 20
            }
            """.data(using: String.Encoding.utf8)!
    }
    
    static func InvalidForecastLocationData() -> Data {
        //missing city
        return """
            "forecast": [{
                "highTemperature": "20.00",
                "lowTemperature": "8.10",
                "iconName": "sunny",
                "weekday": "Monday"
                },
                {
                "highTemperature": "20.00",
                "lowTemperature": "8.10",
                "iconName": "sunny",
                "weekday": "Tuesday"
                }],
                "latitude": 10,
                "longitude": 20
            }
            """.data(using: String.Encoding.utf8)!
    }
    
    static func ForecastData() -> Data {
        return """
            {
            "highTemperature": "20.00",
            "lowTemperature": "8.10",
            "iconName": "sunny",
            "weekday": "Monday"
            }
            """.data(using: String.Encoding.utf8)!
    }
    
    static func InvalidForecastData() -> Data {
        //Temperature are passed as doubles instead of strings
        return """
            {
            "highTemperature": 20.00,
            "lowTemperature": 8.10,
            "iconName": "sunny",
            "weekday": "Monday"
            }
            """.data(using: String.Encoding.utf8)!
    }
    
    static func EmptyData() -> Data {
        return "".data(using: String.Encoding.utf8)!
    }
    
    static func ErrorData(_ message: String) -> Data {
        return """
            {
            "Type": "Invalid Request",
            "Message": ["\(message)"]
            }
            """.data(using: String.Encoding.utf8)!
    }
    
    static func InvalidErrorData() -> Data {
        //Message is missing
        return """
            {
            "Type": "Invalid Request",
            }
            """.data(using: String.Encoding.utf8)!
    }
}
