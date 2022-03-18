//
//  ServiceManager.swift
//  SwiftUIMVVMCombineAlamofire
//
//  Created by Rajendran Eshwaran on 3/13/22.
//

import Foundation
import Combine
import Alamofire

enum NetworkErrors: Error{
    case urlError
    case responseError
    case decoderError
    case unknownError
}
struct NetworkError: Error {
  let initialError: AFError
  let backendError: BackendError?
}

struct BackendError: Codable, Error {
    var status: String
    var message: String
}
protocol ServiceProtocol{
    func getTopMoviesServiceData()-> AnyPublisher<TopMoviesDataModel,NetworkErrors>
}

class Service{
    static let shared = Service()
    private init(){}
}

extension Service: ServiceProtocol{
    
    
    func getTopMoviesServiceData() -> AnyPublisher<TopMoviesDataModel,NetworkErrors> {
        let url = URL.getMoviesUrl()
        return AF.request(url!,method: .get)
                     .publishDecodable(type: TopMoviesDataModel.self)
                     .value()
                     .mapError { _ in NetworkErrors.decoderError }
                     .eraseToAnyPublisher()
    }
    
    func getTopTVShowsServiceData()-> AnyPublisher<TopTVShowsDataModel,Error>{
        let url = URL.getTVShowsUrl()!
        return AF.request(url, method: .get)
            .publishDecodable(type: TopTVShowsDataModel.self)
            .tryCompactMap { (response) -> TopTVShowsDataModel? in
                if let error = response.error { throw error }
                return response.value
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

