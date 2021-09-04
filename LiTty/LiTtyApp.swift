//
//  LiTtyApp.swift
//  LiTty
//
//  Created by 土田妃華 on 2021/09/02.
//
//

import SwiftUI

@main
struct LiTtyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
            .environmentObject(CountTimer())
        }
    }
}
