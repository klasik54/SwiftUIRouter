//
//  ProfileView.swift
//  SwiftUIRouterSample
//
//  Created by Matúš Klasovitý on 05/08/2024.
//

import SwiftUI
import SwiftUIRouter
import OSLog

struct ProfileView: View, WithNavigationBarProperties {
    
    @EnvironmentObject var router: Router<HomePath>
    
    var navigationTitle: String? { "Profile" }
    var largeTitleDisplayMode: UINavigationItem.LargeTitleDisplayMode { .never }
    
    init() {
        Logger.routingLogger.info("Profile init")
    }
    
    var body: some View {
        VStack {
            Text("Profile")
        
            Button("Present favorites") {
                router.present(.favorites)
            }
        }
    }

}
