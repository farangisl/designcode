//
//  DesignCodeApp.swift
//  DesignCode
//
//  Created by Махмадёрова Фарангис Шухратовна on 06.03.2023.
//

import SwiftUI

@main
struct DesignCodeApp: App {
    @StateObject var model = Model()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
}
