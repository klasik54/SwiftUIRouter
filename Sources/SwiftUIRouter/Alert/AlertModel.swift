//
//  AlertModel.swift
//
//
//  Created by Matúš Klasovitý on 04/11/2023.
//

import UIKit

/// Alert model used to build UIAlertController.
/// - Parameters:
///    - title: Title of the alert.
///    - message: Message of the alert.
///    - prefferdStyle: Preffered  style of the alert. Default is .alert.
///    - actions: Actions of the alert. Use ``SwiftUIRouter/AlertActionBuilder`` to build actions.
/// ## Usage:
/// ``` swift
///  AlertModel(
///     title: "Title",
///     message: "Message",
///     actions: {
///         UIAlertAction(title: "Action 1", style: .default, handler: nil)
///         if Bool.random() {
///             UIAlertAction(title: "Action 2", style: .default, handler: nil)
///         }
///         for _ in 0..<3 {
///             UIAlertAction(title: "Action 3", style: .default, handler: nil)
///         }
///         if Bool.random() {
///             UIAlertAction(title: "Action 4", style: .default, handler: nil)
///         } else {
///             UIAlertAction(title: "Action 5", style: .default, handler: nil)
///         }
///     }
/// )
/// ```
public struct AlertModel {
    
    // MARK: - Properties
    
    let title: String
    let message: String
    let prefferdStyle: UIAlertController.Style
    @AlertActionBuilder let actions: () -> [UIAlertAction]
    
    // MARK: - Init
    
    public init(
        title: String,
        message: String,
        prefferdStyle: UIAlertController.Style = .alert,
        @AlertActionBuilder actions: @escaping () -> [UIAlertAction]
    ) {
        self.title = title
        self.message = message
        self.prefferdStyle = prefferdStyle
        self.actions = actions
    }
    
}
