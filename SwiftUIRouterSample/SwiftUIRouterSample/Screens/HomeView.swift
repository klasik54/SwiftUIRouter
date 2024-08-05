//
//  HomeView.swift
//  SwiftUIRouterSample
//
//  Created by Matúš Klasovitý on 05/08/2024.
//

import SwiftUI
import SwiftUIRouter
import OSLog

struct HomeView: View, WithNavigationBarProperties {
    
    @EnvironmentObject var router: Router<HomePath>
    
    var navigationTitle: String? { "Home" }
    
    init() {
        Logger.routingLogger.info("Home View init")
    }
    
    var body: some View {
        VStack {
            Text("Home")
            
            Button("Show alert") {
                router.showAlert(AlertModel(
                    title: "Alert title",
                    message: "Alert message",
                    actions: {
                        if Bool.random() {
                            UIAlertAction(
                                title: "True action",
                                style: .default,
                                handler: { _ in
                                    print("Hello")
                                }
                            )
                        } else {
                            UIAlertAction(
                                title: "False action",
                                style: .default
                            )
                        }
                        UIAlertAction(title: "Cancel", style: .cancel)
                    }
                ))
            }
            
            Button("Show action sheet") {
                router.showAlert(AlertModel(
                    title: "Action sheet title",
                    message: "Action sheet message",
                    prefferdStyle: .actionSheet,
                    actions: {
                        for i in 1...3 {
                            UIAlertAction(
                                title: "Action \(i)",
                                style: .default,
                                handler: { _ in
                                    print("Hello \(i)")
                                }
                            )
                        }
                        UIAlertAction(title: "Cancel", style: .cancel)
                    }
                ))
            }
         
            Button("Go to profile") {
                router.push(.profile)
            }
        }
    }
    
}

#Preview {
    HomeView()
}
