//
//  KerjainProjectApp.swift
//  KerjainProject
//
//  Created by Dragonfly378 on 25/7/25.
//

import FirebaseCore
import SwiftUI

@main
struct KerjainProjectApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
