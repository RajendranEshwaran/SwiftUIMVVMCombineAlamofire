//
//  TopTVShowView.swift
//  SwiftUIMVVMCombineAlamofire
//
//  Created by Rajendran Eshwaran on 3/13/22.
//

import SwiftUI

struct TopTVShowView: View {
    @StateObject var tvshowVM = TVShowViewModel()
    var body: some View {
        NavigationView{
            List{
                ForEach(tvshowVM.tvshowData.indices, id:\.self){ idx in
                    HStack{
                        NavigationLink(destination: DetailedView(model: tvshowVM.tvshowData,index: idx), label: {
                            AsyncImage(url:  URL(string: tvshowVM.tvshowData[idx].image ?? "")){image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 80, height: 100, alignment: .center)
                            }placeholder: {
                                ProgressView()
                            }
                            VStack(alignment:.leading){
                                Text("Title: \(tvshowVM.tvshowData[idx].title ?? "")")
                                Text("Release Date: \(tvshowVM.tvshowData[idx].year ?? "")")
                                Text("IMDbRating : \(tvshowVM.tvshowData[idx].imDBRating ?? "")")
                            }
                        })
                    }
                }
            }
            .navigationTitle("TopTVShows")
        }
        .onAppear(){
            tvshowVM.getTVshowData()
        }
    }
}

struct TopTVShowView_Previews: PreviewProvider {
    static var previews: some View {
        TopTVShowView()
    }
}

struct DetailedView : View{
    var model : [TVItem]
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
