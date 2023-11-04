//
//  Logger.swift
//
//
//  Created by Matúš Klasovitý on 04/11/2023.
//

import OSLog

@available(iOS 14.0, *)
extension Logger {
    
    static let swiftUIRouterLogger = Logger(subsystem: Bundle.main.bundlePath, category: "SwiftUIRouter")
    
}
