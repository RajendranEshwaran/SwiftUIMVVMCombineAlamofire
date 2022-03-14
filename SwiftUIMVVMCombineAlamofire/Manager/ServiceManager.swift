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
    func getServiceData()-> AnyPublisher<DataResponse<TopMoviesDataModel,NetworkErrors>,Never>
}

class Service{
    static let shared = Service()
    private init(){}
}

extension Service: ServiceProtocol{
    func getServiceData() -> AnyPublisher<DataResponse<TopMoviesDataModel, NetworkErrors>, Never> {
        let url = URL.getMoviesUrl()
        
        return AF.request(url!,method: .get)
            .validate()
            .publishDecodable(type:TopMoviesDataModel.self)
            .map{ response in
                response.mapError { error in
                    let backendError = response.data.flatMap { try? JSONDecoder().decode(BackendError.self, from: $0)}
                    return NetworkErrors.decoderError
                }
            }
            .receive(on:DispatchQueue.main)
            .eraseToAnyPublisher()
    }    
}

