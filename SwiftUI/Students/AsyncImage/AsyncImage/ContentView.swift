//
//  ContentView.swift
//  AsyncImage
//
//  Created by ihlas on 24.01.2022.
//

import SwiftUI
extension Image{
    func imageModifer() -> some View{
        self
            .resizable()
            .scaledToFit()
    }
    func imageModifier() -> some View{
        self
            .imageModifier()
            .frame(width: 128)
            .foregroundColor(.purple)
            .opacity(0.5)
       
        
    }
}




struct ContentView: View {
    private let imageURL: String = "https://credo.academy/credo-academy@3x.png"
    var body: some View{
        //MARK: - 1.Basic
        //AsyncImage(url: URL(string: imageURL))
        //
        //MARK: -2.Scale
  AsyncImage(url: URL(string: imageURL), scale: 3.0)
        
       /* //MARK: - 3.Palceholder:
        AsyncImage(url: URL(string: imageURL)) { image in
            image.imageModifier()
                
        }placeholder: {
            Image(systemName: "photo.circle.fill")
            
        }
        .padding(40)
        */
        
        //MARK: - 4.PHASE
        AsyncImage(url: URL(string: imageURL)) { phase in
            
            if let image =  phase.image {
                image.imageModifier()
            }else if phase.error != nil{
                Image(systemName: "anti.circle.fill").imageModifier()
            }else{
                Image(systemName: "photo.circle.fill").imageModifier()
            }
        }
      
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


