//
//  NavigationControllerView.swift
//
//
//  Created by Matúš Klasovitý on 04/11/2023.
//

import SwiftUI

struct NavigationControllerView<T: Hashable, Content: View>: UIViewControllerRepresentable {

    // MARK: - Typealias
    
    typealias UIViewControllerType = UINavigationController

    // MARK: - Properties
    
    @ObservedObject var router: Router<T>
    @ScreenBuilder let buildView: (T) -> Content
    let navigationController = UINavigationController()
    
    // MARK: - Methods
    
    func makeUIViewController(context: Context) -> UINavigationController {
        let rootView = buildView(router.root)
        let viewController = UIHostingController(rootView: rootView)

        // navigationController.viewControllers = [viewController]
        navigationController.navigationBar.prefersLargeTitles = true

        return navigationController
    }
    
    func updateUIViewController(_ navigationController: UINavigationController, context: Context) {}
    
    // MARK: - Coordinator
    
    func makeCoordinator() -> NavigationControllerViewCoordinator<T, Content> {
        NavigationControllerViewCoordinator(
            navigationController: navigationController,
            router: router,
            buildView: buildView
        )
    }
    
}
