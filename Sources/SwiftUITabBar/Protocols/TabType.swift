//
//  TabType.swift
//
//
//  Created by Matúš Klasovitý on 04/11/2023.
//

import SwiftUI

/// A protocol that represents a tab in a `TabBarView`.
public protocol TabType {
    
    /// The index of the tab.
    var index: Int { get }
    
    /// The view that is presented when the tab is selected.
    var view: AnyView { get }
    
    /// The tab bar item that is presented in the tab bar.
    var tabBarItem: UITabBarItem { get }
    
}
