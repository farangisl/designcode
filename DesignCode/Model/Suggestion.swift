//
//  Suggestion.swift
//  DesignCode
//
//  Created by Махмадёрова Фарангис Шухратовна on 31.03.2023.
//

import SwiftUI

struct Suggestion: Identifiable {
    let id = UUID()
    var text: String
}

var suggestions = [
    Suggestion(text: "Swift UI"),
    Suggestion(text: "React"),
    Suggestion(text: "Flutter"),
    Suggestion(text: "Design")
]
