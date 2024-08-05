//
//  FavoritesView.swift
//  SwiftUIRouterSample
//
//  Created by Matúš Klasovitý on 05/08/2024.
//

import SwiftUI
import SwiftUIRouter
import OSLog

struct FavoritesView: View, WithNavigationBarProperties {
    
    @EnvironmentObject var router: Router<FavoritesPath>
    
    var navigationTitle: String? { "Favorites" }
    var largeTitleDisplayMode: UINavigationItem.LargeTitleDisplayMode { .never }
    
    init() {
        Logger.routingLogger.info("Favorites view init")
    }
    
    var body: some View {
        VStack {
            Text("Favorites")
        }
    }
    
}
