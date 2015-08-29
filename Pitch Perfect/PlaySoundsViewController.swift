//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by JohannesLewiste on 8/15/15.
//  Copyright (c) 2015 MohdFirdause. All rights reserved.
//

import UIKit
import AVFoundation


class PlaySoundsViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer!
    var receivedAudio: RecordedAudio!
    var audioEngine: AVAudioEngine!
    var audioFile: AVAudioFile!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        audioPlayer = AVAudioPlayer(contentsOfURL: receivedAudio.filePathUrl, error: nil)
        audioPlayer.enableRate = true
        audioEngine = AVAudioEngine()
        audioFile = AVAudioFile(forReading: receivedAudio.filePathUrl, error: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    @IBAction func playChipmunk(sender: UIButton) { 
        soundEffects(1000)
    }
    
    
    @IBAction func playDarthVader(sender: UIButton) {
        soundEffects(-1000)
    }
    
    @IBAction func playFastAudio(sender: UIButton) {
        stopAudio()
        soundRate(1.5)
    }

    @IBAction func playSlowAudio(sender: UIButton) {
        stopAudio()
        soundRate(0.5)
    }
    
    @IBAction func stopAudioEffects(sender: UIButton) {
        stopAudio()
    }
    
    func stopAudio() {
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
    }
    
    func soundRate(rate: Float) {
        audioPlayer.rate = rate
        audioPlayer.currentTime = 0.0
        audioPlayer.play()
    }
    
    func soundEffects(pitch: Float) {
        stopAudio()
        var audioPlayerNode = AVAudioPlayerNode()
        var audioPitch = AVAudioUnitTimePitch()
        
        audioPitch.pitch = pitch
        
        audioEngine.attachNode(audioPlayerNode)
        audioEngine.attachNode(audioPitch)
        
        // Connect AVAudioPlayer node to AVAudioUnitTimePitch
        audioEngine.connect(audioPlayerNode, to: audioPitch, format: nil)
        // Connect AVAudioUnitTimePitch to speakers
        audioEngine.connect(audioPitch, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        audioEngine.startAndReturnError(nil)
        audioPlayerNode.play()
    }
   
}
