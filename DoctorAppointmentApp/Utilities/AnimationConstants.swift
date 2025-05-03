//
//  AnimationConstants.swift
//  DoctorAppointmentApp
//
//  Created by Manish Jawale on 03/05/25.
//
import SwiftUI

// Utilities/AnimationConstants.swift
struct AnimationConstants {
    static let shortDuration = 0.3
    static let mediumDuration = 0.6
    static let longDuration = 0.9
    
    static let gentleBounce = Animation.interpolatingSpring(
        mass: 0.7,
        stiffness: 80,
        damping: 7,
        initialVelocity: 0
    )
    
    static let standardEaseInOut = Animation.easeInOut(duration: mediumDuration)
}
