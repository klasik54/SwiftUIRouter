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
    let navigationController: UINavigationController
    
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
    
    // MARK: - Methods
    
    func makeUIViewController(context: Context) -> UINavigationController {
        let rootView = buildView(router.root)
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
