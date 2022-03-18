//
//  TVShowViewModel.swift
//  SwiftUIMVVMCombineAlamofire
//
//  Created by Rajendran Eshwaran on 3/17/22.
//

import Foundation
import Combine
class TVShowViewModel : ObservableObject{
    @Published var tvshowData : [TVItem] = []
    private var cancellable = Set<AnyCancellable>()
    
    func getTVshowData(){
        let cancellable = Service.shared.getTopTVShowsServiceData()
            .sink(receiveCompletion: { result in
                switch result{
                case .finished:
                    print("Fetch Success")
                case .failure:
                    print("Fetch Failed")
                }
            }, receiveValue: {response in
                self.tvshowData = response.items ?? []
            })
        self.cancellable.insert(cancellable)
    }
}
