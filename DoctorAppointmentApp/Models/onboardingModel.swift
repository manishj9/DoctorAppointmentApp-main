//
//  onboardingModel.swift
//  DoctorAppointmentApp
//
//  Created by Manish Jawale on 02/05/25.
//

import SwiftUI

import SwiftUI

struct OnboardingItem: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let color: Color
    let imageName: String
}

extension OnboardingItem {
    static let items: [OnboardingItem] = [
        OnboardingItem(
            title: "Discover Experienced Doctors",
            subtitle: "Find and book appointments with top-rated specialists in various fields",
            color: Color(red: 0.28, green: 0.58, blue: 0.95),
            imageName: "doctorOB1"
        ),
        OnboardingItem(
            title: "Effortless Appointment Booking",
            subtitle: "Schedule your visits in just a few taps, anytime anywhere",
            color: Color(red: 0.34, green: 0.73, blue: 0.38),
            imageName: "doctorOB2"
        ),
        OnboardingItem(
            title: "Learn About Your Doctors",
            subtitle: "Get detailed information about doctors' specialties and experience",
            color: Color(red: 0.96, green: 0.61, blue: 0.21),
            imageName: "doctorOB3"
        )
    ]
}
