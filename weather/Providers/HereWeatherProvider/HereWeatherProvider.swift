//
//  HereWeatherProvider.swift
//  weather
//

import Foundation

class HereWeatherProvider: SevenDaysWeatherForecastProvider {

    enum QueryParams {
        static let appId = "app_id"
        static let appCode = "app_code"
        static let product = "product"
        static let name = "name"
        static let language = "language"
    }

    enum ProductTypes {
        static let observation = "observation"
        static let forecast7daysSimple = "forecast_7days_simple"
    }

    let configuration: HereWeatherProviderConfiguration
    let urlSession: URLSessionProtocol

    convenience init() {
        self.init(configuration: HereWeatherProviderConfiguration(),
                  urlSession: URLSession.shared)
    }

    init(configuration: HereWeatherProviderConfiguration, urlSession: URLSessionProtocol) {
        self.configuration = configuration
        self.urlSession = urlSession
    }

    private func makeFindForecastURL(city: String) -> URL {
        var components = URLComponents()
        components.scheme = configuration.scheme
        components.host = configuration.host
        components.path = configuration.path
        components.queryItems = [URLQueryItem]()
        components.queryItems?.append(URLQueryItem(name: QueryParams.product, value: ProductTypes.forecast7daysSimple))
        components.queryItems?.append(URLQueryItem(name: QueryParams.name, value: city))
        components.queryItems?.append(URLQueryItem(name: QueryParams.appId, value: configuration.appId))
        components.queryItems?.append(URLQueryItem(name: QueryParams.appCode, value: configuration.appCode))
        components.queryItems?.append(URLQueryItem(name: QueryParams.language, value: NSLocale.current.languageCode))

        return components.url!
    }

    func findForecast(with city: String, completion: ForecastCompletionHandler) {
        var request = URLRequest(url: makeFindForecastURL(city: city))
        request.httpMethod = "GET"
        _ = urlSession.dataTask(with: request,
                                completionHandler: { [weak self] (data, response, error) -> Void in
                                    if error != nil {
                                        completion?(nil, error)
                                        return
                                    }

                                    guard let response = response as? HTTPURLResponse,
                                        let data = data else {
                                            completion?(nil, CustomError("Unable to parse data"))
                                            return
                                    }

                                    self?.parseResponse(response: response,
                                                        data: data,
                                                        completion: completion)
        }).resume()
    }

    private func parseResponse(response: HTTPURLResponse, data: Data, completion: ForecastCompletionHandler) {
        do {
            if response.statusCode == 200 {
                let responseModel = try JSONDecoder().decode(HereWeatherResponse.self, from: data)
                completion?(responseModel.dailyForecasts, nil)
            } else {
                let errorModel = try JSONDecoder().decode(HereWeatherResponseError.self, from: data)
                completion?(nil, errorModel.error)
            }
        } catch _ {
            completion?(nil, CustomError("Unable to parse data"))
        }
    }
}
