//
//  String.swift
//  SwiftfulThinking-Crypto
//
//  Created by James Greiner on 5/15/23.
//

import Foundation

extension String {
    var removingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
