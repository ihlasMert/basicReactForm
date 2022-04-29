//
//  ContentView.swift
//  RestartApp
//
//  Created by ihlas on 24.01.2022.
//

import SwiftUI

struct ContentView: View {
@AppStorage("onboarding") var isOnboardingVieActive: Bool = true
    var body: some View {
        ZStack{
            if isOnboardingVieActive{
                OnboradingView() //True = OnboardingScreen
                
            }else{
                HomeView() // False = Home Screen
            }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
