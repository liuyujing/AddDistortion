//
//  ViewController.swift
//  AddDistortion
//
//  Created by Bruce on 16/6/7.
//  Copyright © 2016年 Bruce. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    lazy var engine = AVAudioEngine()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let intput = engine.inputNode!
        let output = engine.outputNode
        
//        创建设置失真
        let distortion = AVAudioUnitDistortion()
        distortion.loadFactoryPreset(.SpeechRadioTower)
        distortion.preGain = 4
        distortion.wetDryMix = 80
        
//        将distortion附着到 音频引擎
        engine.attachNode(distortion)
        
//        开始连接各个节点
        engine.connect(intput, to: distortion, format: intput.inputFormatForBus(0))
        engine.connect(distortion, to: output, format: intput.inputFormatForBus(0))
        
//        开启引擎
        try! engine.start()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

