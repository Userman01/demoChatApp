//
//  DemoChatAppApp.swift
//  DemoChatApp
//
//  Created by Петр Постников on 21.02.2022.
//

import SwiftUI
import Firebase
@main
struct DemoChatAppApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
