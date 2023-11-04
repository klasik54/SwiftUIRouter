//
//  TabBarCoordinator.swift
//  
//
//  Created by Matúš Klasovitý on 04/11/2023.
//

import UIKit
import Combine

final class TabBarCoordinator<Tab: TabType> {
    
    private var cancellables = Set<AnyCancellable>()
    
    init(tabBarController: UITabBarController, tabBarProvider: TabBarProvider<Tab>) {
        bindState(tabBarController: tabBarController, tabBarProvider: tabBarProvider)
    }
    
    func bindState(tabBarController: UITabBarController, tabBarProvider: TabBarProvider<Tab>) {
        tabBarProvider.$selectedTab
            .sink { selectedTab in
                tabBarController.selectedIndex = selectedTab.index
            }
            .store(in: &cancellables)
    }
    
}
