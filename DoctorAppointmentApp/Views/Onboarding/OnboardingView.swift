//
//  OnboardingView.swift
//  DoctorAppointmentApp
//
//  Created by Manish Jawale on 02/05/25.
//



// Views/Onboarding/OnboardingView.swift
import SwiftUI

struct OnboardingView: View {
    @AppStorage("hasCompletedOnboarding") var hasCompletedOnboarding: Bool = false
    @State private var currentPage = 0
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            // Background with gradient overlay
            OnboardingItem.items[currentPage].color
                .opacity(0.1)
                .ignoresSafeArea()
                .animation(.easeInOut(duration: 0.6), value: currentPage)
                .animation(.bouncy(), value: 0.3)
            
            VStack(spacing: 0) {
                // App header
                Text("Doctor Appointment App")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.primary)
                    .padding(.top, 50)
                    .opacity(isAnimating ? 1 : 0)
                    .offset(y: isAnimating ? 0 : -20)
                    .animation(.easeOut(duration: 0.5).delay(0.2), value: isAnimating)
                
                Spacer()
                
                // Main content with illustrations
                TabView(selection: $currentPage) {
                    ForEach(Array(OnboardingItem.items.enumerated()), id: \.element.id) { index, item in
                        OnboardingCardView(item: item, isActive: currentPage == index)
                            .tag(index)
                    }
                    .gentleBounce(delay: 0.2)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .frame(height: 400)
                .padding(.bottom, 20)
                
                // Page indicators
                HStack(spacing: 10) {
                    ForEach(0..<OnboardingItem.items.count, id: \.self) { index in
                        Capsule()
                            .fill(currentPage == index ? OnboardingItem.items[index].color : Color.gray.opacity(0.3))
                            .frame(width: currentPage == index ? 20 : 8, height: 8)
                            .animation(.spring(response: 0.3, dampingFraction: 0.7), value: currentPage)
                            .animation(.bouncy(), value: 0.3)
                    }
                }
                .padding(.bottom, 30)
                
                // Navigation controls
                HStack {
                    // Back button
                    if currentPage > 0 {
                        Button(action: navigateBack) {
                            Image(systemName: "chevron.left")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(width: 50, height: 50)
                                .background(
                                    Circle()
                                        .fill(OnboardingItem.items[currentPage-1].color)
                                )
                                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 3)
                                .animation(.spring(response: 0.3, dampingFraction: 0.7), value: currentPage)
                                .animation(.bouncy(), value: 0.3)
                        }
                        .transition(.asymmetric(
                            insertion: .move(edge: .leading).combined(with: .opacity),
                            removal: .move(edge: .leading).combined(with: .opacity)
                        ))
                    } else {
                        Spacer()
                            .frame(width: 50, height: 50)
                    }
                    
                    Spacer()
                    
                    // Next/Get Started button
                    if currentPage < OnboardingItem.items.count - 1 {
                        Button(action: navigateForward) {
                            Image(systemName: "chevron.right")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(width: 50, height: 50)
                                .background(
                                    Circle()
                                        .fill(OnboardingItem.items[currentPage].color)
                                )
                                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 3)
                                .animation(.bouncy(), value: 0.3)
                        }
                        .transition(.asymmetric(
                            insertion: .move(edge: .trailing).combined(with: .opacity),
                            removal: .move(edge: .trailing).combined(with: .opacity)
                        ))
                    } else {
                        Button(action: completeOnboarding) {
                            Text("Get Started")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(.horizontal, 24)
                                .padding(.vertical, 12)
                                .background(OnboardingItem.items[currentPage].color)
                                .cornerRadius(25)
                                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 3)
                                .animation(.bouncy(), value: 0.3)
                        }
                        .transition(.asymmetric(
                            insertion: .move(edge: .trailing).combined(with: .opacity),
                            removal: .move(edge: .trailing).combined(with: .opacity)
                        ))
                    }
                }
                .padding(.horizontal, 30)
                .padding(.bottom, 40)
                .frame(maxWidth: .infinity)
            }
        }
        .onAppear {
            withAnimation(.easeOut(duration: 0.5)) {
                isAnimating = true
                
            }
        }
    }
    
    private func navigateForward() {
        withAnimation(.spring(response: 0.5, dampingFraction: 0.8, blendDuration: 0.5)) {
            if currentPage < OnboardingItem.items.count - 1 {
                currentPage += 1
            }
        }
    }
    
    private func navigateBack() {
        withAnimation(.spring(response: 0.5, dampingFraction: 0.8, blendDuration: 0.5)) {
            if currentPage > 0 {
                currentPage -= 1
                
            }
        }
    }
    
    private func completeOnboarding() {
        withAnimation(.easeInOut(duration: 0.5)) {
            hasCompletedOnboarding = true
        }
    }
}
