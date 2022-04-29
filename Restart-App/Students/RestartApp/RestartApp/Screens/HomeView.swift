//
//  HomeView.swift
//  RestartApp
//
//  Created by ihlas on 25.01.2022.
//

import SwiftUI

struct HomeView: View {
    //MARK: -Property
    
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    @State private var isAnimating: Bool = false
    //MARK: -Body

    var body: some View {
        ZStack{
        VStack(spacing: 20){
           //MARK: -Header
            Spacer()
            
            ZStack {
                CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.2)
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                .padding()
                .offset(y: isAnimating ? 35 : -35)
                .animation(
                Animation
                    .easeInOut(duration: 4)
                    .repeatForever()
                    ,value: isAnimating
                )
            }
            
            
            //MARK: - Center
            
            Text("The time that leads to mastery is dependet on the intensity of our focus")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            
            
            //MARK: - Footer
            
            Spacer()
            
            
            
            
            
            
        Button(action: {
            withAnimation{
                playSound(sound: "success", type: "m4a")
            isOnboardingViewActive = true
            }
        }){
     Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                .imageScale(.large)
            Text("Restart")
                .font(.system(.title3, design: .rounded))
                .fontWeight(.bold)
        
        }
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.capsule)
        .controlSize(.large)
}//: VSTAck
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05, execute:{
                isAnimating  = true
            }
            )
        }
        )
            
        
    }
}
//MARK: - preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

}

