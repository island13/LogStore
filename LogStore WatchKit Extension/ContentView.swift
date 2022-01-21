//
//  ContentView.swift
//  LogStore WatchKit Extension
//
//  Created by Svensson, Andreas on 1/21/22.
//

import SwiftUI
import OSLog


struct ContentView: View {
    @State private var text = "☹️"
    var body: some View {
        Text(text)
            .padding()
            .onAppear {
                do {
                    let logStore = try OSLogStore(scope: .currentProcessIdentifier)
                    
                    let entries = try logStore.getEntries(matching: NSPredicate(format: "subsystem == %@", "Watch"))
                    for entry in entries {
                        text = entry.composedMessage
                        break
                    }
                } catch {
                    os_log(.error, "Cannot read the log store: \(error.localizedDescription)")
                }
                
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
