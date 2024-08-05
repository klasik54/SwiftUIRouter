//
//  FavoritesRouter.swift
//  SwiftUIRouterSample
//
//  Created by Matúš Klasovitý on 05/08/2024.
//

import SwiftUI
import SwiftUIRouter

enum FavoritesPath: String {
    
    case favorites

}

struct FavoritesRouter: View {

    @ObservedObject var router: Router<FavoritesPath> = Router(root: .favorites)
    
    
    var body: some View {
        RouterView(router: router) { path in
            switch path {
            case .favorites:
                FavoritesView()
            }
        }
    }

}

