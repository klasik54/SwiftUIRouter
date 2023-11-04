//
//  Router.swift
//
//
//  Created by Matúš Klasovitý on 04/11/2023.
//

import UIKit

/// A router object that manages a navigation. Use this object to push, pop, and set paths on the navigation stack.
/// A router object is responsible for managing the navigation of a single path. You use router objects in conjunction with ``SwiftUIRouter/RouterView`` to implement your app's navigation.
/// - Parameters:
/// - T: A type that represents a path.
/// ## Usage
/// ``` swift
///  enum Path: Hashable {
///
///     case home
///     case profile
///
///  }
///
///  @ObservedObject var router = Router<Path>(root: .home)
///  ```
public final class Router<T: Hashable>: ObservableObject {
    
    // MARK: - Steps
    
    enum Step {
        
        case push(T, animated: Bool)
        case pop(animated: Bool)
        case set([T], animated: Bool)
        case popToRoot(animated: Bool)
        case present(T, presentationStyle: UIModalPresentationStyle, transitionStyle: UIModalTransitionStyle, animated: Bool, completion: VoidClosure?)
        case dismiss(animated: Bool, completion: VoidClosure?)
        
    }
    
    // MARK: - Properties
    
    @Published private(set) var root: T
    @Published private(set) var step: Step?
    
    // MARK: - Init
    
    public init(root: T) {
        self.root = root
        self.step = .set([root], animated: false)
    }

    /// Pushes a path onto the navigation stack.
    /// - Parameters:
    ///  - path: A path to push onto the stack.
    ///  - animated: A Boolean value that indicates whether the transition is to be animated.
    public func push(_ path: T, animated: Bool = true) {
        step = .push(path, animated: animated)
    }

    /// Pops the top path from the navigation stack.
    /// - Parameters:
    ///    - animated: A Boolean value that indicates whether the transition is to be animated.
    public func pop(animated: Bool = true) {
        step = .pop(animated: animated)
    }

    public func updateRoot(root: T) {
        self.root = root
    }

    /// Pops all the paths on the stack except the root path.
    /// - Parameters:
    ///    - animated: A Boolean value that indicates whether the transition is to be animated.
    public func popToRoot(animated: Bool = true) {
        step = .popToRoot(animated: animated)
    }
    
    /// Sets the paths on the stack.
    /// - Parameters:
    ///    - paths: An array of paths to set.
    ///    - animated: A Boolean value that indicates whether the transition is to be animated.
    public func set(_ paths: [T], animated: Bool = true) {
        step = .set(paths, animated: animated)
    }
    
    /// Presents a path modally.
    /// - Parameters:
    ///   - path: A path to present modally.
    ///   - presentationStyle: The presentation style of the modal view controller.
    ///   - transitionStyle: The transition style to use when presenting the view controller.
    ///   - animated: A Boolean value that indicates whether the transition is to be animated.
    ///   - completion: The block to execute after the presentation finishes.
    public func present(
        _ path: T,
        presentationStyle: UIModalPresentationStyle = .automatic,
        transitionStyle: UIModalTransitionStyle = .coverVertical,
        animated: Bool = true,
        completion: VoidClosure? = nil
    ) {
        step = .present(
            path,
            presentationStyle: presentationStyle,
            transitionStyle: transitionStyle,
            animated: animated,
            completion: completion
        )
    }
    
    /// Dismisses the view controller that was presented modally.
    /// - Parameters:
    ///    - animated: A Boolean value that indicates whether the transition is to be animated.
    ///    - completion: The block to execute after the view controller is dismissed.
    public func dismiss(
        animated: Bool = true,
        completion: VoidClosure? = nil
    ) {
        step = .dismiss(animated: animated, completion: completion)
    }

}
