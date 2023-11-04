//
//  Screen.swift
//  
//
//  Created by Matúš Klasovitý on 04/11/2023.
//

import UIKit

/// A protocol that allows you to set navigation bar properties from your SwiftUI view.
/// ## Usage
/// ``` swift
/// struct FooView: View, WithNavigationBarProperties {
///
///     var navigationTitle: String? { "Foo" }
///
///     var body: some View {
///         Text("Foo")
///     }
/// }
/// ```
public protocol WithNavigationBarProperties {
    
    /// The title of the navigation bar.
    var navigationTitle: String? { get }
    
    /// A Boolean value that indicates whether the back button is hidden.
    var hidesBackButton: Bool { get }
    
    /// The display mode for the navigation bar.
    var largeTitleDisplayMode: UINavigationItem.LargeTitleDisplayMode { get }
    
}

public extension WithNavigationBarProperties {
    
    var navigationTitle: String? { nil }
    var hidesBackButton: Bool { false }
    var largeTitleDisplayMode: UINavigationItem.LargeTitleDisplayMode { .automatic }
    
}
