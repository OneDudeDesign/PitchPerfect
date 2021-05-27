//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Christopher Lucier on 5/27/21.
// published to Github for Udacity Grading
//code built using Udacity lessons including fixing the button aspects from linked StackOverflow articles

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    var recordedAudioURL: URL!
    //setup the outlets for the buttons (though not used in this iteration)
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!

    enum ButtonType: Int {
        case slow = 0, fast, chipmunk, vader, echo, reverb
    }
    //switch-case function to utilize the extension with appropriate parameters
    @IBAction func playSoundForButton(_ sender: UIButton) {
        switch(ButtonType(rawValue: sender.tag)!) {
            case .slow:
                playSound(rate: 0.5)
            case .fast:
                playSound(rate: 1.5)
            case .chipmunk:
                playSound(pitch: 1000)
            case .vader:
                playSound(pitch: -1000)
            case .echo:
                playSound(echo: true)
            case .reverb:
                playSound(reverb: true)
            }

            configureUI(.playing)
    }

    @IBAction func stopButtonPressed(_ sender: AnyObject) {
        //stop the audio when the button is pressed
        stopAudio()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //calls the extension
        setupAudio()
    }
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        //initial setup of the ui via the extensions
        configureUI(.notPlaying)
    }

}
