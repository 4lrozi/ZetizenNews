//
//  NewsListView.swift
//  ZetizenNews
//
//  Created by DDL11 on 20/08/23.
//

import SwiftUI

struct NewsListView: View {
    @StateObject private var newsVM = NewsViewModel()
    
    var body: some View {
        NavigationStack {
            if newsVM.isLoading {
                ProgressView("Load News...")
            } else {
                VStack {
                    CategoriesView(categories: newsVM.uniqueCategories, selectedCategory: $newsVM.selectedCategory)
                    List(newsVM.filteredNews) { newsItem in
                        ZStack(alignment: .leading) {
                            NewsCellView(news: newsItem)
                            
                            NavigationLink(destination: NewsDetailView(news: newsItem)) {
                                EmptyView()
                            }
                            .buttonStyle(PlainButtonStyle())
                            .opacity(0.0)
                        }
                    }
                    .listStyle(.plain)
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar(content: {
                        ToolbarItem(placement: .principal) {
                            AsyncImage(url: URL(string: "https://zetizen.s3.amazonaws.com/img/logo.png")) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 150, height: 50)
                            } placeholder: {
                                Text("Zetizen News")
                            }
                        }
                    })
                    .refreshable {
                        await newsVM.fetchNews()
                    }
                }
            }
        }
        .task {
            await newsVM.fetchNews()
        }
    }
}

struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView()
    }
}
