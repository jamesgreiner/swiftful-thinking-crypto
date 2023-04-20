//
//  HapticManager.swift
//  SwiftfulThinking-Crypto
//
//  Created by James Greiner on 4/19/23.
//

import Foundation
import SwiftUI

class HapticManager {
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
}
