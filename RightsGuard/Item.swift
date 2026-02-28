//
//  Item.swift
//  RightsGuard
//
//  Created by Lauren Gonzalez-Perez on 2/27/26.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
