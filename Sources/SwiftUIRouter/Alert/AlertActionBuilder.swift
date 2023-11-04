//
//  AlertActionBuilder.swift
//
//
//  Created by Matúš Klasovitý on 04/11/2023.
//

import UIKit

/// Builder for UIAlertActions.
@resultBuilder
public struct AlertActionBuilder {
        
    /// Base build block
    public static func buildBlock(_ components: [UIAlertAction]...) -> [UIAlertAction] {
        components.flatMap { $0 }
    }
    
    /// Add support for both single and collections of UIAlertActions.
    public static func buildExpression(_ expression: UIAlertAction) -> [UIAlertAction] {
        [expression]
    }

    public static func buildExpression(_ expression: [UIAlertAction]) -> [UIAlertAction] {
        expression
    }
    
    /// Add support for optionals.
    public static func buildOptional(_ components: [UIAlertAction]?) -> [UIAlertAction] {
        return components ?? [] // (components?.first!)!
    }
    
    /// Add support for if else statements.
    public static func buildEither(first components: [UIAlertAction]) -> [UIAlertAction] {
        components
    }

    public static func buildEither(second components: [UIAlertAction]) -> [UIAlertAction] {
        components
    }
    
    /// Add support for loops.
    public static func buildArray(_ components: [[UIAlertAction]]) -> [UIAlertAction] {
        components.flatMap { $0 }
    }
    
}
