//
//  TabBarView.swift
//  
//
//  Created by Matúš Klasovitý on 04/11/2023.
//

import SwiftUI

/// Wrapper arround UIKit's UITabBarController. It's used to present SwiftUI views as tabs.
///  - Parameters:
///     - tabs: Array of TabType objects. TabType is a protocol that represents a tab.
///     - tabBarProvider: TabBarProvider object that is used to control the TabBarView.
/// ## Usage
/// ``` swift
/// enum Tabs: Int, TabType, CaseIterable {
///
///     case foo
///     case baz
///
///     var index: Int {
///         rawValue
///     }
///
///     var view: AnyView {
///         switch self {
///         case .foo:
///             return AnyView(FooTabRouter())
///
///         case .baz:
///             return AnyView(BarView())
///         }
///     }
///
///     var tabBarItem: UITabBarItem {
///         switch self {
///         case .foo:
///             return UITabBarItem(
///                 title: "foo",
///                 image: UIImage(systemName: "house"),
///                 tag: 0
///             )
///
///         case .baz:
///             return UITabBarItem(
///                 title: "baz",
///                 image: UIImage(systemName: "star"),
///                 tag: 1
///             )
///         }
///     }
///
/// }
///
///
/// struct ContentView: View {
///
///     @ObservedObject var tabBarProvider = TabBarProvider<Tabs>(selectedTab: .foo)
///
///     var body: some View {
///         TabBarView(tabs: Tabs.allCases, tabBarProvider: tabBarProvider)
///     }
///
/// }
/// ```
public struct TabBarView<Tab: TabType>: View {
    
    // MARK: - Properties
    
    let tabs: [Tab]
    @ObservedObject var tabBarProvider: TabBarProvider<Tab>
    
    public init(tabs: [Tab], tabBarProvider: TabBarProvider<Tab>) {
        self.tabs = tabs
        self.tabBarProvider = tabBarProvider
    }
    
    // MARK: - Body
    
    public var body: some View {
        if #available(iOS 14, *) {
            content()
                .ignoresSafeArea(.all)
        } else {
            content()
                .edgesIgnoringSafeArea(.all)
        }
    }

}

// MARK: - Components

private extension TabBarView {
    
    func content() -> some View {
        TabBarController(
            tabs: tabs,
            tabBarProvider: tabBarProvider
        ).environmentObject(tabBarProvider)
    }
    
}
