//
//  NewsModel.swift
//  ZetizenNews
//
//  Created by DDL11 on 18/08/23.
//

import Foundation

class NewsViewModel: ObservableObject {
    @Published var news: [ZetizenNewsItem] = []
    @Published var isLoading = false
    @Published var searchText: String = ""
    @Published var selectedCategory: String? = nil
    
    // Fetch News Categories
    var uniqueCategories: [String] {
        Set(news.flatMap { $0.categories }).sorted()
    }
    
    var filteredNews: [ZetizenNewsItem] {
        if let selectedCategory = selectedCategory, !selectedCategory.isEmpty {
            return news.filter { news in
                news.categories.contains(selectedCategory)
            }
        } else {
            return news
        }
    }

    
    var finderNews: [ZetizenNewsItem] {
        if !searchText.isEmpty {
            return news.filter { news in
                news.title.localizedCaseInsensitiveContains(searchText)
            }
        } else {
            return []
        }
    }

    
    func fetchNews() async {
        DispatchQueue.main.async {
            self.isLoading = true // Set isLoading to true while fetching
        }
        
        Task {
            do {
                let url = URL(string: "https://berita-indo-api-next.vercel.app/api/zetizen-jawapos-news/movie")!
                let (data, _) = try await URLSession.shared.data(from: url)
                let response = try JSONDecoder().decode(ZetizenNewsResponse.self, from: data)
                
                DispatchQueue.main.async {
                    self.news.append(contentsOf: response.data.map { newsData in
                        ZetizenNewsItem(
                            creator: newsData.creator,
                            title: newsData.title,
                            link: newsData.link,
                            content: newsData.content,
                            categories: newsData.categories,
                            isoDate: newsData.isoDate,
                            image: newsData.image
                        )
                    })
                    self.isLoading = false
                }
            } catch {
                print("Error fetching data: \(error)")
            }
        }
    }
    
}
