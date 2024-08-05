//
//  ContentView.swift
//  SwiftUIRouterSample
//
//  Created by Matúš Klasovitý on 05/08/2024.
//

import SwiftUI
import SwiftUITabBar

enum Tabs: Int, TabType, CaseIterable {
    
    case home
    case favorites
    
    var index: Int {
        rawValue
    }
    
    var view: AnyView {
        switch self {
        case .home:
            return AnyView(HomeRouter())
            
        case .favorites:
            return AnyView(FavoritesRouter())
        }
    }
    
    var tabBarItem: UITabBarItem {
        switch self {
        case .home:
            return UITabBarItem(
                title: "Home",
                image: UIImage(systemName: "house"),
                tag: 0
            )
            
        case .favorites:
            return UITabBarItem(
                title: "Favorites",
                image: UIImage(systemName: "star"),
                tag: 1
            )
        }
    }
    
}


struct ContentView: View {
    
    @ObservedObject var tabBarProvider = TabBarProvider<Tabs>(selectedTab: .home)
    
    var body: some View {
        TabBarView(tabs: Tabs.allCases, tabBarProvider: tabBarProvider)
    }

}


#Preview {
    ContentView()
}
