//
//  PreferenceKeys.swift
//  DesignCode
//
//  Created by Махмадёрова Фарангис Шухратовна on 28.03.2023.
//

import SwiftUI

struct ScrollPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
