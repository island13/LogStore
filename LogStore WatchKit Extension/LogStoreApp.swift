//
//  LogStoreApp.swift
//  LogStore WatchKit Extension
//
//  Created by Svensson, Andreas on 1/21/22.
//

import SwiftUI
import OSLog

@main
struct LogStoreApp: App {
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
            .onAppear {
                os_log(.info, log: OSLog(subsystem: "Watch", category: "Log"), "🙂")
            }
        }
        
    }
}
