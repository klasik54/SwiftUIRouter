//
//  ScreenBuilder.swift
//
//
//  Created by Matúš Klasovitý on 04/11/2023.
//

import SwiftUI

/// Builder for creating a view in ``SwiftUIRouter/RouterView``.
@resultBuilder
public struct ScreenBuilder {
    
    public static func buildBlock() -> EmptyView {
        EmptyView()
    }
    
    public static func buildBlock<Content: View>(_ content: Content) -> Content {
        return content
    }
    
    public static func buildEither<TrueContent: View, FalseContent: View>(
        first component: TrueContent
    ) -> ScreenConditionContent<TrueContent, FalseContent> {
        return ScreenConditionContent(trueContent: component)
    }
    
    public static func buildEither<TrueContent: View, FalseContent: View>(
        second component: FalseContent
    ) -> ScreenConditionContent<TrueContent, FalseContent> {
        return ScreenConditionContent(falseContent: component)
    }

}

