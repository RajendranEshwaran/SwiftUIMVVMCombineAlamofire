//
//  TopMovies.swift
//  SwiftUIMVVMCombineAlamofire
//
//  Created by Rajendran Eshwaran on 3/13/22.
//

import SwiftUI

struct TopMoviesView: View {
    @StateObject var movieVM = ViewModel()
    var body: some View {
        NavigationView{
            
        }.onAppear(){
            movieVM.getMovieList()
        }
    }
}

struct TopMoviesView_Previews: PreviewProvider {
    static var previews: some View {
        TopMoviesView()
    }
}
