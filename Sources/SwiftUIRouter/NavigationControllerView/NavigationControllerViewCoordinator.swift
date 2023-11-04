//
//  NavigationControllerViewCoordinator.swift
//
//
//  Created by Matúš Klasovitý on 04/11/2023.
//

import SwiftUI
import Combine

final class NavigationControllerViewCoordinator<T: Hashable, Content: View> {
    
    // MARK: - Properties
    
    private let navigationController: UINavigationController
    private let buildView: (T) -> Content

    // MARK: - Combine
    
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Init
    
    init(navigationController: UINavigationController, router: Router<T>, buildView: @escaping (T) -> Content) {
        self.navigationController = navigationController
        self.buildView = buildView
        
        bindState(router: router)
    }
    
}

// MARK: - Private

private extension NavigationControllerViewCoordinator {
    
    func bindState(
        router: Router<T>
    ) {
        router.$step
            .sink { [weak self] step in
                guard let self = self else { return }
                
                switch step {
                case .push(let path, let animated):
                    push(path, animated: animated)
                    
                case .set(let paths, let animated):
                    set(paths, animated: animated)
                    
                case .pop(let animated):
                    pop(animated: animated)
                    
                case .popToRoot(let animated):
                    popToRoot(animated: animated)
                    
                case .present(let path, let presentationStyle, let transitionStyle, let animated, let completion):
                    present(
                        path,
                        presentationStyle: presentationStyle,
                        transitionStyle: transitionStyle,
                        animated: animated,
                        completion: completion
                    )

                case .none:
                    break
                }
            }
            .store(in: &cancellables)
    }
    
    // MARK: - Navigation functions
    
    func push(_ path: T, animated: Bool) {
        let viewController = createViewController(from: path)
        navigationController.pushViewController(viewController, animated: animated)
    }
    
    func pop(animated: Bool) {
        navigationController.popViewController(animated: animated)
    }
    
    func popToRoot(animated: Bool) {
        navigationController.popToRootViewController(animated: animated)
    }
    
    func set(_ paths: [T], animated: Bool) {
        let viewControllers = paths.map { path -> UIViewController in
            let viewController = createViewController(from: path)
            return viewController
        }
        
        navigationController.setViewControllers(viewControllers, animated: animated)
    }
    
    func present(
        _ path: T,
        presentationStyle: UIModalPresentationStyle,
        transitionStyle: UIModalTransitionStyle,
        animated: Bool,
        completion: VoidClosure?
    ) {
        let viewController = createViewController(from: path)
        viewController.modalTransitionStyle = transitionStyle
        viewController.modalPresentationStyle = presentationStyle
        
        navigationController.present(viewController, animated: animated, completion: completion)
    }
    
    // MARK: - Helpers
    
    func createViewController(from path: T) -> UIViewController {
        let view = buildView(path)
        let viewController = UIHostingController(rootView: view)
        
        if let screen = view as? WithNavigationBarProperties {
            viewController.title = screen.navigationTitle
            viewController.navigationItem.largeTitleDisplayMode = screen.largeTitleDisplayMode
            viewController.navigationItem.hidesBackButton = screen.hidesBackButton
        }
        
        return viewController
    }
    
}
