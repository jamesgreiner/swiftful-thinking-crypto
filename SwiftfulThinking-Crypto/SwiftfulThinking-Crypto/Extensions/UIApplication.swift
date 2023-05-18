//
//  UIApplication.swift
//  SwiftfulThinking-Crypto
//
//  Created by James Greiner on 4/13/23.
//

import Foundation
import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
