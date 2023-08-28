//
//  ContentView.swift
//  ZetizenNews
//
//  Created by DDL11 on 18/08/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var tabSelection = 0
    
    var body: some View {
        TabView(selection: $tabSelection) {
            NewsListView()
                .tabItem {
                    if tabSelection == 0{
                        Image("homeSelected")
                    } else {
                        Image("home")
                    }
                }
                .tag(0)
            SearchView()
                .tabItem {
                    if tabSelection == 1{
                        Image("searchSelected")
                    } else {
                        Image("search")
                    }
                }
                .tag(1)
            FavoriteView()
                .tabItem {
                    if tabSelection == 2{
                        Image("favSelected")
                    } else {
                        Image("fav")
                    }
                }
                .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
