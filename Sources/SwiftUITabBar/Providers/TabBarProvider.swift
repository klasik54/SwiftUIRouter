//
//  TabBarProvider.swift
//  
//
//  Created by Matúš Klasovitý on 04/11/2023.
//

import Foundation

/// Tab bar provider is used to control the selected tab in the ``TabBarView/TabBarView``
public final class TabBarProvider<Tab: TabType>: ObservableObject {

    // MARK: - Properties

    @Published var selectedTab: Tab
    
    // MARK: - Init

    public init(selectedTab: Tab) {
        self.selectedTab = selectedTab
    }
    
}
