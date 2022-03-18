//
//  ViewModel.swift
//  SwiftUIMVVMCombineAlamofire
//
//  Created by Rajendran Eshwaran on 3/13/22.
//

import Foundation
import Combine

class TopMoviesViewModel : ObservableObject{
    @Published var topmoviesData:[MovieItem] =  [MovieItem]()
    @Published var moviesError: String = ""
    @Published var showAlert: Bool = false
    private var cancellableSet : Set<AnyCancellable> = []
    var dataManager: ServiceProtocol
    var cancellation: AnyCancellable?
    init( dataManager: ServiceProtocol = Service.shared) {
            self.dataManager = dataManager
        }
    
    func getMovieList() {
            dataManager.getTopMoviesServiceData()
            .sink(receiveCompletion: { result in
                switch result{
                case .finished:
                    print("Fetch Success")
                case .failure:
                    print("Fetch Failed")
                }
            }, receiveValue: {response in
                self.topmoviesData = response.items ?? []
                print(self.topmoviesData)
            }).store(in: &cancellableSet)
        }
}

    
