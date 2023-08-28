//
//  SearchView.swift
//  ZetizenNews
//
//  Created by DDL11 on 20/08/23.
//

import SwiftUI

struct SearchView: View {
    @StateObject private var newsVM = NewsViewModel()
    
    var body: some View {
        NavigationStack {
                VStack {
                    List(newsVM.finderNews) { newsItem in
                        NavigationLink(destination: NewsDetailView(news: newsItem)) {
                            NewsCellView(news: newsItem)
                        }
                    }
                    .listStyle(.plain)
                    .searchable(text: $newsVM.searchText)
                }
        }
        .task {
            await newsVM.fetchNews()
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
