//
//  ScreenConditionContent.swift
//
//
//  Created by Matúš Klasovitý on 04/11/2023.
//

import SwiftUI
import OSLog

/// Conditionally displays one of two views. The result  view is selected based on a given condition and navigation properties are inherited from the selected view.
/// - Parameters:
///    - trueContent: The view to display when the condition is true.
///    - falseContent: The view to display when the condition is false.
public struct ScreenConditionContent<TrueContent: View, FalseContent: View>: View, WithNavigationBarProperties {

    // MARK: - Properties
    
    let trueContent: TrueContent?
    let falseContent: FalseContent?
    
    // MARK: - Init
    
    init(trueContent: TrueContent) {
        self.trueContent = trueContent
        self.falseContent = nil
    }
    
    init(falseContent: FalseContent) {
        self.trueContent = nil
        self.falseContent = falseContent
    }
    
    // MARK: - Navigation Bar Properties
    
    public var navigationTitle: String? {
        if let trueContent = trueContent as? WithNavigationBarProperties {
            return trueContent.navigationTitle
        } else if let falseContent = falseContent as? WithNavigationBarProperties {
            return falseContent.navigationTitle
        } else {
            return nil
        }
    }
    
    public var largeTitleDisplayMode: UINavigationItem.LargeTitleDisplayMode {
        if let trueContent = trueContent as? WithNavigationBarProperties {
            return trueContent.largeTitleDisplayMode
        } else if let falseContent = falseContent as? WithNavigationBarProperties {
            return falseContent.largeTitleDisplayMode
        } else {
            return .automatic
        }
    }
    
    // MARK: - Body
    
    public var body: some View {
        if let trueContent = trueContent {
            trueContent
        } else if let falseContent = falseContent {
            falseContent
        } else {
            EmptyView()
                .onAppear {
                    if #available(iOS 14, *) {
                        Logger.swiftUIRouterLogger.critical("ScreenConditionContent must have at least one content view")
                    }
                    fatalError("ScreenConditionContent must have at least one content view")
                }
        }
    }
    
}
