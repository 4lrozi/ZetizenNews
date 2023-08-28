//
//  ZetizenNewsApp.swift
//  ZetizenNews
//
//  Created by DDL11 on 18/08/23.
//

import SwiftUI

@main
struct ZetizenNewsApp: App {
    @StateObject var favoriteManager = FavoriteManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(favoriteManager)
        }
    }
}
