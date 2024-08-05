//
//  Logger.swift
//  SwiftUIRouterSample
//
//  Created by Matúš Klasovitý on 05/08/2024.
//

import Foundation
import OSLog

extension Logger {
    
    static let routingLogger = Logger(subsystem: Bundle.main.bundlePath, category: "routing")
    
}
