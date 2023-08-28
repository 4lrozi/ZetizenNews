//
//  FavoriteDetailView.swift
//  ZetizenNews
//
//  Created by DDL11 on 21/08/23.
//

import SwiftUI

struct FavoriteDetailView: View {
    let news: ZetizenNewsItem
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var favoriteManager: FavoriteManager
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    AsyncImage(url: URL(string: news.image)) { phase in
                        phase.resizable().scaledToFill()
                            .overlay {
                                Color.black
                                    .opacity(0.5)
                            }
                    } placeholder: {
                        ProgressView()
                            .frame(width: 80, height: 80)
                    }
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 229)
                    .clipped()
                    
                    VStack(alignment: .leading, spacing: 16) {
                        VStack(alignment: .leading, spacing: 20) {
                            Text(news.title)
                                .font(.custom("Helvetica Neue", size: 13))
                                .foregroundColor(Color("Black"))
                                .fontWeight(.bold)
                                .lineLimit(nil)
                            
                            HStack(spacing: 10) {
                                Image("avatar")
                                
                                Text("By: \(news.creator)")
                                    .font(.custom("Helvetica Neue", size: 13))
                                    .foregroundColor(Color("Gray"))
                                    .fontWeight(.medium)
                                
                                Spacer()
                                
                                Text(news.isoDate.formattedDate())
                                    .font(.custom("Helvetica Neue", size: 13))
                                    .foregroundColor(Color("Gray"))
                                    .fontWeight(.medium)
                            }
                        }
                        
                        Text(news.content)
                            .font(.system(.body, design: .rounded))
                            .lineLimit(nil)
                        
                        Text("Categories: \(news.categories.joined(separator: ", "))") // Display categories
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        Link(destination: URL(string: news.link)!) {
                            HStack {
                                Text("Selengkapnya")
                                Image(systemName: "link")
                            }
                            .frame(width: 156, height: 32)
                            .background(Color.primary)
                            .mask(RoundedRectangle(cornerRadius: 6))
                            .foregroundStyle(.white)
                        }
                        .offset(x: 200, y: 40)
                    }
                    .padding()
                }
            }
            
        }
        .navigationBarBackButtonHidden(true)
        .toolbar(.hidden, for: .tabBar)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button{
                    dismiss()
                } label: {
                    Image(systemName: "chevron.backward")
                }
            }
        }.foregroundColor(.black)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack{
                        Button{}label: {
                            Image(systemName: "square.and.arrow.up")
                        }
                        Button{
                            favoriteManager.removeFromFavorite(item: news)
                        } label: {
                            Image("favSelected")
                            Text("Remove Bookmark")
                        }
                    }
                }
            }
    }
}

struct FavoriteDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteDetailView(news: ZetizenNewsItem(
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
