//
//  HomeView.swift
//  SwiftUIMVVMCombineAlamofire
//
//  Created by Rajendran Eshwaran on 3/13/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView{
            TopMoviesView()
                .tabItem{
                    Text("TopMovies")
                    Image(systemName: "film")
                        .tabbbarIcons(width: 30, height: 30)
                }
            
            TopTVShowView()
                .tabItem{
                    Text("TopTVShows")
                    Image(systemName: "tv")
                        .tabbbarIcons(width: 30, height: 30)
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
