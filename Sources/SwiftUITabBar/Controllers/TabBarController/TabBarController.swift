//
//  TabBarController.swift
//
//
//  Created by Matúš Klasovitý on 04/11/2023.
//

import SwiftUI

/// A view that displays a tab bar.
struct TabBarController<Tab: TabType>: UIViewControllerRepresentable {
        
    // MARK: - Properties
    
    let tabs: [Tab]
    @ObservedObject var tabBarProvider: TabBarProvider<Tab>
    private let tabBarController = UITabBarController()
    
    // MARK: - Methods
    
    func makeUIViewController(context: Context) -> UITabBarController {
        let viewControllers = tabs.map { tabItem in
            let viewController = UIHostingController(rootView: tabItem.view)
            viewController.tabBarItem = tabItem.tabBarItem
            
            return viewController
        }
        
        tabBarController.setViewControllers(viewControllers, animated: false)
        tabBarController.selectedIndex = tabBarProvider.selectedTab.index
  
        return tabBarController
    }
    
    func updateUIViewController(_ tabBarController: UITabBarController, context: Context) {}
    
    // MARK: - Coordinator
    
    func makeCoordinator() -> TabBarCoordinator<Tab> {
        TabBarCoordinator(tabBarController: tabBarController, tabBarProvider: tabBarProvider)
    }
    
}
