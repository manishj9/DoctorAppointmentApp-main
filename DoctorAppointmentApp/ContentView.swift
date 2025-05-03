//
//  ContentView.swift
//  DoctorAppointmentApp
//
//  Created by Manish Jawale on 29/04/25.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("hasCompletedOnboarding") var hasCompletedOnboarding = false
    
    var body: some View {
        Group {
            if !hasCompletedOnboarding {
                OnboardingView()
            } else {
                SignInView()
            }
        }
    }
}


#Preview {
    ContentView()
}
