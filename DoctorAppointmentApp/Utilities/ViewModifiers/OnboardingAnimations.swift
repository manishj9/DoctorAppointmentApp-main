//
//  OnboardingAnimations.swift
//  DoctorAppointmentApp
//
//  Created by Manish Jawale on 02/05/25.
//

// Utilities/ViewModifiers/OnboardingAnimations.swift
import SwiftUI

extension View {
    func slideInFromLeading(delay: Double = 0, duration: Double = 0.8) -> some View {
        modifier(SlideInAnimation(edge: .leading, delay: delay, duration: duration))
    }
    
    func slideInFromTrailing(delay: Double = 0, duration: Double = 0.8) -> some View {
        modifier(SlideInAnimation(edge: .trailing, delay: delay, duration: duration))
    }
    
    func fadeIn(delay: Double = 0, duration: Double = 0.6) -> some View {
        modifier(FadeInAnimation(delay: delay, duration: duration))
    }
    
    func gentleBounce(delay: Double = 0, duration: Double = 0.6) -> some View {
        modifier(BounceAnimation(delay: delay, duration: duration))
    }
}

struct SlideInAnimation: ViewModifier {
    let edge: Edge
    let delay: Double
    let duration: Double
    
    @State private var animate = false
    
    func body(content: Content) -> some View {
        content
            .offset(x: edge == .leading ? (animate ? 0 : -UIScreen.main.bounds.width/4) :
                     (animate ? 0 : UIScreen.main.bounds.width/4),
                   y: 0)
            .animation(.spring(response: duration, dampingFraction: 0.7).delay(delay), value: animate)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                    withAnimation {
                        animate = true
                    }
                }
            }
    }
}

struct FadeInAnimation: ViewModifier {
    let delay: Double
    let duration: Double
    
    @State private var animate = false
    
    func body(content: Content) -> some View {
        content
            .opacity(animate ? 1 : 0)
            .animation(.easeInOut(duration: duration).delay(delay), value: animate)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                    withAnimation {
                        animate = true
                    }
                }
            }
    }
}

struct BounceAnimation: ViewModifier {
    let delay: Double
    let duration: Double
    
    @State private var animate = false
    
    func body(content: Content) -> some View {
        content
            .scaleEffect(animate ? 1 : 0.8)
            .animation(.interpolatingSpring(
                mass: 0.7,
                stiffness: 80,
                damping: 7,
                initialVelocity: 0
            ).delay(delay), value: animate)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                    withAnimation {
                        animate = true
                    }
                }
            }
    }
}
