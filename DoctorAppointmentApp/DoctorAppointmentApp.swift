//
//  DoctorAppointmentAppApp.swift
//  DoctorAppointmentApp
//
//  Created by Manish Jawale on 29/04/25.
//

import SwiftUI
import UIKit
import FirebaseCore

class AppDelegate: NSObject , UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
@main
struct DoctorAppointmentApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView1()
        }
    }
}

struct ContentView1: View {
    @AppStorage("hasCompletedOnboarding") var hasCompletedOnboarding = false
    init() {
            #if DEBUG
            // Reset onboarding for testing (only in debug builds)
            UserDefaults.standard.removeObject(forKey: "hasCompletedOnboarding")
            print("Onboarding reset for development")
            #endif
        }
    var body: some View {
        Group {
            if hasCompletedOnboarding {
                SignInView()
            } else {
                OnboardingView()
            }
        }
    }
}
