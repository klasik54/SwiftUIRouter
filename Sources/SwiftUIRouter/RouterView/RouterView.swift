//
//  RouterView.swift
//
//
//  Created by Matúš Klasovitý on 04/11/2023.
//

import SwiftUI

/// A view that manages a navigation. Use this view to implement your app's navigation with ``SwiftUIRouter/Router``.
/// RouterView provides a ``SwiftUIRouter/Router`` object to its environment. You can use this ``SwiftUIRouter/Router`` object to push, pop, and set paths on the navigation stack.
/// Access this view's ``SwiftUIRouter/Router`` object by declaring it as an environment object in the view that's the destination of your navigation.
/// - Parameters:
///  - router: A router that manages a navigation.
///  - buildView: A closure that creates a view for a given path.
/// ## Usage
/// ``` swift
/// enum Paths: Hashable {
///
///    case foo
///    case bar
///    case baz
///
///  }
///
///  struct ContentView: View {
///
///    @ObservedObject var router = Router<Paths>(root: .foo)
///
///    var body: some View {
///        RouterView(router: router) { path in
///            switch path {
///            case .foo:
///                FooView()
///
///            case .bar:
///                BarView()
///
///            case .baz:
///                BazView()
///            }
///        }
///    }
///
///  }
/// ```
public struct RouterView<T: Hashable, Content: View>: View {
    
    // MARK: - Properties
    
    @ObservedObject private var router: Router<T>
    private let navigationController: UINavigationController
    @ScreenBuilder private var buildView: (T) -> Content
    
    // MARK: - Init
    
    public init(
        router: Router<T>,
        navigationController: UINavigationController = UINavigationController(),
        @ScreenBuilder buildView: @escaping (T) -> Content
    ) {
        self.router = router
        self.navigationController = navigationController
        self.buildView = buildView
    }
    
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

private extension RouterView {
    
    func content() -> some View {
        NavigationControllerView(router: router, navigationController: navigationController) { path in
            buildView(path)
        }
        .environmentObject(router)
    }

}
