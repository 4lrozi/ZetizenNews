//
//  NewsCellView.swift
//  ZetizenNews
//
//  Created by DDL11 on 18/08/23.
//

import SwiftUI
import CoreData

struct NewsCellView: View {
    @EnvironmentObject var favoriteManager: FavoriteManager
    
    let news: ZetizenNewsItem
    
    var body: some View {
        HStack(spacing: 10) {
            AsyncImage(url: URL(string: news.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 137, height: 140)
                    .clipShape(Rectangle())
            } placeholder: {
                ProgressView()
                    .frame(width: 137, height: 140)
            }
            
            VStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: 10) {
                    Text(news.title)
                        .font(.custom("Helvetica Neue", size: 16))
                        .foregroundColor(Color("Black"))
                        .fontWeight(.bold)
                        .lineLimit(4)
                    
                    Text("By \(news.creator)")
                        .lineLimit(1)
                        .font(.custom("Helvetica Neue", size: 13))
                        .foregroundColor(Color("Gray"))
                        .fontWeight(.medium)
                }
                Spacer()
                HStack(spacing: 10) {
                    Text(news.categories[0].capitalized)
                        .lineLimit(1)
                        .font(.custom("Helvetica Neue", size: 13))
                        .fontWeight(.bold)
                        .foregroundColor(Color("Cyan"))
                    
                    Circle()
                        .frame(width: 6, height: 6)
                        .foregroundColor(Color("Gray"))
                    
                    Text(news.isoDate.formattedDate())
                        .lineLimit(1)
                        .font(.custom("Helvetica Neue", size: 13))
                        .foregroundColor(Color("Gray"))
                        .fontWeight(.medium)
                    
                    Spacer()
                    
                    Menu {
                        Button {
                        }
                        label: {
                            Image(systemName: "square.and.arrow.up")
                            Text("Share")
                        }
                        Button {
                            favoriteManager.addToFavorite(item: news)
                        } label: {
                            Image("fav")
                            Text("Add Bookmark")
                        }
                    } label: {
                        Image(systemName: "ellipsis")
                            .frame(width: 24, height: 24)
                    }
                }
                Spacer().frame(height: 8)
            }
        }
        .frame(height: 140)
    }
    
}

struct NewsCellView_Previews: PreviewProvider {
    static var previews: some View {
        NewsCellView(news: ZetizenNewsItem(
            creator: "This is author",
            title: "This is sample title",
            link: "This is link",
            content: "This is sample description so you can see it in long text",
            categories: ["Satu", "Dua", "Tiga"],
            isoDate: "2023-08-13T02:44:58.000Z",
            image: "https://blue.kumparan.com/image/upload/fl_progressive,fl_lossy,c_fill,q_auto:best,w_480,f_jpg/v1634025439/01h7mjymq414642m0rfxmzeqsh.jpg")
        )
    }
}
