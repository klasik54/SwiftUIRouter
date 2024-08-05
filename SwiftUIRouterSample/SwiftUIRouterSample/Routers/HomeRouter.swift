//
//  TabBarRouter.swift
//  SwiftUIRouterSample
//
//  Created by Matúš Klasovitý on 05/08/2024.
//

import SwiftUI
import SwiftUIRouter

enum HomePath: String {
    
    case home
    case profile
    case favorites

}

struct HomeRouter: View {
    
    @ObservedObject var router: Router<HomePath> = Router(root: .home)
    
    var body: some View {
        RouterView(router: router) { path in
            switch path {
            case .home:
                HomeView()

            case .profile:
                ProfileView()
                
            case .favorites:
                FavoritesView()
            }
        }
    }
    
}
