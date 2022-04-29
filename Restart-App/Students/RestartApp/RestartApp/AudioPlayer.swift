//
//  AudioPlayer.swift
//  RestartApp
//
//  Created by ihlas on 25.01.2022.
//

import Foundation
import AVFoundation


var audioPlayer: AVAudioPlayer?


func playSound(sound: String, type: String){
    if let path = Bundle.main.path(forResource: sound, ofType: type){
        
        
        do{
          audioPlayer =  try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        }catch{
            print("cound dont play the sound file.")
        }
    }
        
}
