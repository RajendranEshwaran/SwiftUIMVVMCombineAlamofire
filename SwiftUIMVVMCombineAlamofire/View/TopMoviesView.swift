//
//  TopMovies.swift
//  SwiftUIMVVMCombineAlamofire
//
//  Created by Rajendran Eshwaran on 3/13/22.
//

import SwiftUI

struct TopMoviesView: View {
    @StateObject var tvMoviesVM = TopMoviesViewModel()
    var body: some View {
        NavigationView{
            List{
                ForEach(tvMoviesVM.topmoviesData.indices, id:\.self){ idx in
                    HStack{
                        NavigationLink(destination: DetailedMovieView(model: tvMoviesVM.topmoviesData,index: idx), label: {
                            AsyncImage(url:  URL(string: tvMoviesVM.topmoviesData[idx].image ?? "")){image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 80, height: 100, alignment: .center)
                            }placeholder: {
                                ProgressView()
                            }
                            VStack(alignment:.leading){
                                Text("Title: \(tvMoviesVM.topmoviesData[idx].title ?? "")")
                                Text("Release Date: \(tvMoviesVM.topmoviesData[idx].year ?? "")")
                                Text("IMDbRating : \(tvMoviesVM.topmoviesData[idx].imDBRating ?? "")")
                            }
                        })
                    }
                }
            }
            .navigationTitle("TopMovies")
        }
        .onAppear(){
            tvMoviesVM.getMovieList()
        }
    }
}

struct TopMoviesView_Previews: PreviewProvider {
    static var previews: some View {
        TopMoviesView()
    }
}


struct DetailedMovieView : View{
    var model : [MovieItem]
    var index : Int
    @State private var size = UIScreen.main.bounds.size
    var body: some View{
        VStack(alignment: .center, spacing:5){
                
                AsyncImage(url:  URL(string: model[index].image ?? "")){image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: size.width, height: 400)
                }placeholder: {
                    ProgressView()
                }
            Spacer()
            Text("IMDBRank : \(model[index].rank ?? "")")
            Text("Full Title: \(model[index].fullTitle ?? "")")
            Text("Released Year: \(model[index].year ?? "")")
            Text("Crew : \(model[index].crew ?? "")")
            Text("IMDBRating : \(model[index].imDBRating ?? "")")
            Text("IMDBRatingCount : \(model[index].imDBRatingCount ?? "")")
            Spacer()
        }
    }
}
