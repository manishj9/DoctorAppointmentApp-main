//
//  OnboardingCardView.swift
//  DoctorAppointmentApp
//
//  Created by Manish Jawale on 03/05/25.
//

import SwiftUI

struct OnboardingCardView: View {
    let item: OnboardingItem
    let isActive: Bool
    
    @State private var showImage = false
    @State private var showTitle = false
    @State private var showSubtitle = false
    
    var body: some View {
        VStack(spacing: 30) {
            // Illustration with bounce animation
            Image(item.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 220)
                .padding(.horizontal, 20)
                .scaleEffect(showImage ? 1 : 0.8)
                .opacity(showImage ? 1 : 0)
                .animation(.interpolatingSpring(mass: 0.7, stiffness: 80, damping: 7), value: showImage)
                .gentleBounce()
            
            // Title with slide-in animation
            Text(item.title)
                .font(.system(size: 28, weight: .bold))
                .multilineTextAlignment(.center)
                .foregroundColor(.primary)
                .padding(.horizontal, 40)
                .offset(x: showTitle ? 0 : -20)
                .opacity(showTitle ? 1 : 0)
                .animation(.easeOut(duration: 0.6), value: showTitle)
            
            // Subtitle with fade-in animation
            Text(item.subtitle)
                .font(.system(size: 16, weight: .regular))
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .padding(.horizontal, 40)
                .opacity(showSubtitle ? 1 : 0)
                .offset(y: showSubtitle ? 0 : 10)
                .animation(.easeOut(duration: 0.6).delay(0.2), value: showSubtitle)
            
            Spacer()
        }
        .onAppear {
            if isActive {
                resetAnimations()
                triggerAnimations()
            }
        }
        .onChange(of: isActive) { newValue in
            if newValue {
                resetAnimations()
                triggerAnimations()
            }
        }
    }
    
    private func triggerAnimations() {
        withAnimation(.interpolatingSpring(mass: 0.7, stiffness: 80, damping: 7).delay(0.1)) {
            showImage = true
        }
        withAnimation(.easeOut(duration: 0.6).delay(0.3)) {
            showTitle = true
        }
        withAnimation(.easeOut(duration: 0.6).delay(0.5)) {
            showSubtitle = true
        }
    }
    
    private func resetAnimations() {
        showImage = false
        showTitle = false
        showSubtitle = false
    }
}
