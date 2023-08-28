//
//  FavoritesView.swift
//  ZetizenNews
//
//  Created by DDL11 on 20/08/23.
//

import SwiftUI

struct FavoriteView: View {
    
    @StateObject private var newsVM = NewsViewModel()
    @EnvironmentObject var favoriteManager: FavoriteManager
    
    var body: some View {
        NavigationStack {
            if favoriteManager.newses.count == 0 {
                Text("No bookmarked news")
            } else {
                List(favoriteManager.newses) { newsItem in
                    NavigationLink(destination: FavoriteDetailView(news: newsItem)) {
                        FavoriteCellView(news: newsItem)
                            .environmentObject(favoriteManager)
                    }
                }
                .listStyle(.plain)
                .navigationTitle("Zetizen News")
                .navigationBarTitleDisplayMode(.inline)
                .refreshable {
                    await newsVM.fetchNews()
                }
            }
        }
        .task {
            await newsVM.fetchNews()
        }
    }
    
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
            .environmentObject(FavoriteManager())
    }
}
