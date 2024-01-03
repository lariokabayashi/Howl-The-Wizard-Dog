//
//  GameController.swift
//  HowlTheWizardDog
//
//  Created by Larissa Okabayashi on 10/04/23.
//

import Foundation
import SpriteKit
import AVKit
import UIKit
import CoreML
import NaturalLanguage
import SwiftUI

class GameController: SKScene, UITextFieldDelegate{
    static let shared = GameController()
    var TextField = UITextField(frame: CGRect(x: 0, y: -400, width: 1000, height: 60))
    var background: SKSpriteNode?
    var sceneFire: SKSpriteNode?
    var fire_out: SKSpriteNode?
    var dogHi: SKSpriteNode?
    var shape_1 = SKSpriteNode(imageNamed: "shape")
    var shape_2 = SKSpriteNode(imageNamed: "shape_2")
    var shape_3 = SKSpriteNode(imageNamed: "text-2")
    var button1 = SKSpriteNode(imageNamed: "arrow")
    var button2 = SKSpriteNode(imageNamed: "arrow")
    var StartText = SKLabelNode(fontNamed: "Cutesy")
    var HiText = SKLabelNode(fontNamed: "Cutesy")
    var continue_button = SKLabelNode(fontNamed: "Cutesy")
    var page = 1
    var topText = SKLabelNode(fontNamed: "Cutesy")
    var dog: SKSpriteNode?
    var cactus: SKSpriteNode?
    var fire_demon: SKSpriteNode?
    let audioNode = SKAudioNode(fileNamed: "SoundFire")
    
    let animationIdle_7: [SKTexture] = [
        SKTexture(imageNamed: "fire_out1"),
        SKTexture(imageNamed: "fire_out2"),
        SKTexture(imageNamed: "fire_out3"),
        SKTexture(imageNamed: "background_1"),
        SKTexture(imageNamed: "background_2"),
        SKTexture(imageNamed: "background_3"),
        SKTexture(imageNamed: "background_4"),
        SKTexture(imageNamed: "background_5"),
        SKTexture(imageNamed: "background_6"),
        SKTexture(imageNamed: "background_7"),
        SKTexture(imageNamed: "background_8"),
        SKTexture(imageNamed: "background_9")
    ]
    
    func appearTextField() {
        GameController.shared.TextField.isHidden = false
    }
    
    override func didMove(to view: SKView) {
        soundFire()
        
        background = childNode(withName: "background") as? SKSpriteNode
        background?.zPosition = -1
        
        sceneFire = childNode(withName: "sceneFire") as? SKSpriteNode
        
        fire_out = childNode(withName: "fire_out") as? SKSpriteNode
        fire_out?.zPosition = -1
        
        dogHi = childNode(withName: "dogHi") as? SKSpriteNode
        dogHi?.zPosition = -1
        
        cactus = childNode(withName: "cactus") as? SKSpriteNode
        cactus?.zPosition = -1
        
        dog = childNode(withName: "dog") as? SKSpriteNode
        dog?.zPosition = -1
        
        fire_demon = childNode(withName: "fire_demon") as? SKSpriteNode
        fire_demon?.zPosition = -1
        
        shape_1.position = CGPoint(x:0, y:0);
        shape_1.size.width = 805
        shape_1.size.height = 461
        addChild(shape_1)
        
        shape_2.position = CGPoint(x:0, y:400);
        shape_2.size.width = 1258
        shape_2.size.height = 84
        shape_2.zPosition = -1
        addChild(shape_2)
        
        button1.position = CGPoint(x:280, y:-170);
        button1.size.width = 43
        button1.size.height = 50
        addChild(button1)
        
        button2.position = CGPoint(x:550, y:-385)
        button2.size.width = 50
        button2.size.height = 60
        button2.zPosition = -1
        addChild(button2)
        
        StartText.text = "In a world where self expression was forbidden";
        StartText.fontSize = 50;
        StartText.position = CGPoint(x: 0, y: 0)
        StartText.fontColor = UIColor.black
        addChild(StartText)
        
        HiText.text = "This Howl, a wizard dog, he is gonna help us save the world";
        HiText.fontSize = 50;
        HiText.position = CGPoint(x: 0, y: 380)
        HiText.fontColor = UIColor.black
        HiText.zPosition = -1
        addChild(HiText)
        
        topText.text = "Howl has some magical plants in his garden";
        topText.fontSize = 50;
        topText.position = CGPoint(x: 0, y: 380)
        topText.fontColor = UIColor.black
        topText.zPosition = -1
        addChild(topText)
        
        shape_3.position = CGPoint(x:550, y:-440);
        shape_3.size.width = 160
        shape_3.size.height = 50
        shape_3.zPosition = -1
        addChild(shape_3)
        
        continue_button.text = "Continue"
        continue_button.fontSize = 40;
        continue_button.position = CGPoint(x: 550, y: -452)
        continue_button.fontColor = UIColor.black
        continue_button.zPosition = -1
        addChild(continue_button)
        
        let animationIdle: [SKTexture] = [
            SKTexture(imageNamed: "background_1"),
            SKTexture(imageNamed: "background_2"),
            SKTexture(imageNamed: "background_3"),
            SKTexture(imageNamed: "background_4"),
            SKTexture(imageNamed: "background_5"),
            SKTexture(imageNamed: "background_6"),
            SKTexture(imageNamed: "background_7"),
            SKTexture(imageNamed: "background_8"),
            SKTexture(imageNamed: "background_9"),
            SKTexture(imageNamed: "background_10")
        ]

        background?.run(.repeatForever(.animate(with: animationIdle, timePerFrame: 0.5)))
        
        let animationIdle_2: [SKTexture] = [
            SKTexture(imageNamed: "cactus"),
            SKTexture(imageNamed: "cactus_2")
        ]
        cactus?.run(.repeatForever(.animate(with: animationIdle_2, timePerFrame: 0.2)))
        
        let animationIdle_3: [SKTexture] = [
            SKTexture(imageNamed: "dogHi_1"),
            SKTexture(imageNamed: "dogHi_2")
        ]
        
        dogHi?.run(.repeatForever(.animate(with: animationIdle_3, timePerFrame: 0.5)))
        
        let animationIdle_4: [SKTexture] = [
            SKTexture(imageNamed: "fire_demon"),
            SKTexture(imageNamed: "fire_demon_2"),
            SKTexture(imageNamed: "fire_demon_3")
        ]
        fire_demon?.run(.repeatForever(.animate(with: animationIdle_4, timePerFrame: 0.2)))
        
        let animationIdle_5: [SKTexture] = [
            SKTexture(imageNamed: "sceneFire1"),
            SKTexture(imageNamed: "sceneFire2"),
            SKTexture(imageNamed: "sceneFire3")
        ]
        
        sceneFire?.run(.repeatForever(.animate(with: animationIdle_5, timePerFrame: 0.5)))
    }
    
    func SoundNextPage(){
        let audioNode2 = SKAudioNode(fileNamed: "soundNext")
        audioNode2.autoplayLooped = false
        self.addChild(audioNode2)
        let playAction = SKAction.play()
        audioNode2.run(playAction)
    }
    
    func soundFire(){
        audioNode.autoplayLooped = true
        self.addChild(audioNode)
        let playAction = SKAction.play()
        audioNode.run(playAction)
    }
    
    func SoundWrong(){
        let audioNode2 = SKAudioNode(fileNamed: "wrong")
        audioNode2.autoplayLooped = false
        self.addChild(audioNode2)
        let playAction = SKAction.play()
        audioNode2.run(playAction)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            SoundNextPage()
            let location = touch.location(in: self)
            let touchedNode = atPoint(location)
            if touchedNode.position == button1.position{
                if (page == 1){
                    StartText.text = "Only you can save everybody from repression"
                    page += 1
                }
                else if (page == 2){
                    StartText.text = "Using the power of expressing your feelings"
                    page += 1
                }
                else if (page == 3){
                    dogHi?.zPosition = 1
                    shape_1.removeFromParent()
                    button1.removeFromParent()
                    StartText.removeFromParent()
                    
                    shape_2.zPosition = 1
                    HiText.zPosition = 1
                    continue_button.zPosition = 1
                    shape_3.zPosition = 1
                    page += 1
                }
            }
            else if touchedNode.position == continue_button.position{
                if (page == 4){
                    dogHi?.removeFromParent()
                    HiText.removeFromParent()
                    dog?.zPosition = 1
                    topText.zPosition = 1
                    topText.text = "Howl has some magical plants in his garden";
                    page += 1
                }
                else if (page == 5){
                    topText.text = "Their power is enabled when you express the feeling associated with the plant";
                    page += 1
                }
                else if (page == 6){
                    topText.text = "This is the bad mood plant";
                    dog?.position = CGPoint(x: -103, y: -188.5)
                    cactus?.zPosition = 1
                    fire_demon?.zPosition = 1
                    page += 1
                }
                else if (page == 7){
                    topText.text = "Research confirms that talking about your emotions reduces their intensity";
                    page += 1
                }
                else if (page == 8){
                    topText.fontSize = 45
                    topText.text = "So you need to talk about things that made you angry today to stop the fire"
                    page += 1
                }
                else if (page == 10){
                    let nextScene = SKScene(fileNamed: "elementScene")
                    nextScene?.scaleMode = .aspectFill
                    view?.presentScene(nextScene)
                    page += 1
                }
            }
                
            if (page == 9){
                continue_button.zPosition = -1
                shape_3.zPosition = -1
                button2.zPosition = 1
                GameController.shared.appearTextField()
                GameController.shared.TextField.center = CGPointMake(670, 900)
                GameController.shared.TextField.borderStyle = UITextField.BorderStyle.bezel
                GameController.shared.TextField.textColor = UIColor.gray
                GameController.shared.TextField.placeholder = "Ex: I was mad today because I had to wake up early "
                GameController.shared.TextField.backgroundColor = UIColor.white
                GameController.shared.TextField.autocorrectionType = UITextAutocorrectionType.yes
                GameController.shared.TextField.keyboardType = UIKeyboardType.default
                GameController.shared.TextField.delegate = self
                GameController.shared.TextField.returnKeyType = .done
                GameController.shared.TextField.tag = 100
                if view?.viewWithTag(100) == nil {
                    self.view!.addSubview(GameController.shared.TextField)
                }
                let location = touch.location(in: self)
                let touchedNode = atPoint(location)
                if touchedNode.position == button2.position{
                    do{
                        let mlModel = try SentimentClassifier_4(configuration: MLModelConfiguration()).model
                        let sentimentPredictor = try NLModel(mlModel: mlModel)
                        let emotion = sentimentPredictor.predictedLabel(for: GameController.shared.TextField.text!)
                            GameController.shared.TextField.text?.removeAll()
                        if (emotion == "anger" || emotion == "sadness"){
                            audioNode.removeFromParent()
                            audioNode.removeAllChildren()
                            GameController.shared.TextField.isHidden = true
                            button2.removeFromParent()
                            topText.removeFromParent()
                            shape_2.removeFromParent()
                            sceneFire?.removeFromParent()
                            fire_demon?.removeFromParent()
                            fire_out?.zPosition = 1
                            fire_out?.run(.animate(with: animationIdle_7, timePerFrame: 1))
                            shape_3.zPosition = 1
                            continue_button.zPosition = 1
                            page += 1
                        }
                        else{
                            SoundWrong()
                            topText.text = "To calm the spirit of fire you must necessarily say something related to anger"
                        }
                        }
                    catch{
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
}
