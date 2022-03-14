//
//  ViewModel.swift
//  SwiftUIMVVMCombineAlamofire
//
//  Created by Rajendran Eshwaran on 3/13/22.
//

import Foundation
import Combine

class ViewModel : ObservableObject{
    @Published var topmoviesData:[MovieItem] =  [MovieItem]()
    @Published var moviesError: String = ""
    @Published var showAlert: Bool = false
    private var cancellableSet : Set<AnyCancellable> = []
    var dataManager: ServiceProtocol
    
    init( dataManager: ServiceProtocol = Service.shared) {
            self.dataManager = dataManager
            getMovieList()
        }
    
    func getMovieList() {
            dataManager.getServiceData()
                .sink { (dataResponse) in
                    if dataResponse.error != nil {
                        //self.createAlert(with: dataResponse.error!)
                        print("Fetching Error")
                    } else {
                        self.topmoviesData = dataResponse.value?.items ?? []
                        print(self.topmoviesData)
                    }
                }.store(in: &cancellableSet)
        }
}
