//
//  SadnessPlantScene.swift
//  HowlTheWizardDog
//
//  Created by Larissa Okabayashi on 14/04/23.
//

import Foundation
import SpriteKit
import CoreML
import NaturalLanguage

class SadnessPlantScene: SKScene {
    
    var background: SKSpriteNode?
    var rain_21: SKSpriteNode?
    var koiFish: SKSpriteNode?
    var shape_2 = SKSpriteNode(imageNamed: "shape_2")
    var topText = SKLabelNode(fontNamed: "Cutesy")
    var dog: SKSpriteNode?
    var sadPlant: SKSpriteNode?
    var sadPlant2: SKSpriteNode?
    var blue: SKSpriteNode?
    var button2 = SKSpriteNode(imageNamed: "arrow")
    var page = 11
    let audioNode3 = SKAudioNode(fileNamed: "rain")
    let audioNode2 = SKAudioNode(fileNamed: "splash")
    var shape_3 = SKSpriteNode(imageNamed: "text-2")
    var continue_button = SKLabelNode(fontNamed: "Cutesy")
    override func didMove(to view: SKView) {
        SoundRain()
        
        background = childNode(withName: "background") as? SKSpriteNode
        
        rain_21 = childNode(withName: "rain_21") as? SKSpriteNode
        
        sadPlant = childNode(withName: "sadPlant") as? SKSpriteNode
        
        sadPlant2 = childNode(withName: "sadPlant2") as? SKSpriteNode
        sadPlant2?.zPosition = -1
        
        koiFish = childNode(withName: "koi fish") as? SKSpriteNode
        koiFish?.zPosition = -1
        
        blue = childNode(withName: "blue") as? SKSpriteNode
        blue?.zPosition = -1
        
        dog = childNode(withName: "dog") as? SKSpriteNode

        shape_2.position = CGPoint(x:0, y:400);
        shape_2.size.width = 1258
        shape_2.size.height = 84
        addChild(shape_2)

        topText.text = "Now I gonna introduce you to the plant of sadness";
        topText.fontSize = 50;
        topText.position = CGPoint(x: 0, y: 380)
        topText.fontColor = UIColor.black
        addChild(topText)
        
        button2.position = CGPoint(x:550, y:-385)
        button2.size.width = 50
        button2.size.height = 60
        button2.zPosition = -1
        addChild(button2)
        
        shape_3.position = CGPoint(x:550, y:-440);
        shape_3.size.width = 160
        shape_3.size.height = 50
        addChild(shape_3)
        
        continue_button.text = "Continue"
        continue_button.fontSize = 40;
        continue_button.position = CGPoint(x: 550, y: -452)
        continue_button.fontColor = UIColor.black
        addChild(continue_button)
        
        let animationIdle_2: [SKTexture] = [
            SKTexture(imageNamed: "rain_21"),
            SKTexture(imageNamed: "rain_22"),
            SKTexture(imageNamed: "rain_23"),
            SKTexture(imageNamed: "rain_24"),
        ]
        
        rain_21?.run(.repeatForever(.animate(with: animationIdle_2, timePerFrame: 0.5)))
        
        let animationIdle_3: [SKTexture] = [
            SKTexture(imageNamed: "koi fish"),
            SKTexture(imageNamed: "koi fish-2"),
            SKTexture(imageNamed: "koi fish-3"),
            SKTexture(imageNamed: "koi fish-4"),
        ]
        
        koiFish?.run(.repeatForever(.animate(with: animationIdle_3, timePerFrame: 0.3)))
        
        let animationIdle_4: [SKTexture] = [
            SKTexture(imageNamed: "blue1"),
            SKTexture(imageNamed: "blue2"),
            SKTexture(imageNamed: "blue3"),
            SKTexture(imageNamed: "blue4"),
        ]
        
        blue?.run(.repeatForever(.animate(with: animationIdle_4, timePerFrame: 0.2)))
    
    }
    
    func SoundNextPage(){
        let audioNode = SKAudioNode(fileNamed: "soundNext")
        audioNode.autoplayLooped = false
        self.addChild(audioNode)
        let playAction = SKAction.play()
        audioNode.run(playAction)
    }
    
    func SoundWrong(){
        let audioNode = SKAudioNode(fileNamed: "wrong")
        audioNode.autoplayLooped = false
        self.addChild(audioNode)
        let playAction = SKAction.play()
        audioNode.run(playAction)
    }
    
    func SoundSparkles(){
        let audioNode = SKAudioNode(fileNamed: "sparkles")
        audioNode.autoplayLooped = false
        self.addChild(audioNode)
        let playAction = SKAction.play()
        audioNode.run(playAction)
    }
    
    func SoundRain(){
        audioNode3.autoplayLooped = true
        self.addChild(audioNode3)
        let playAction = SKAction.play()
        audioNode3.run(playAction)
    }
    
    func SoundSplash(){
        audioNode2.autoplayLooped = true
        self.addChild(audioNode2)
        let playAction = SKAction.play()
        audioNode2.run(playAction)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            SoundNextPage()
            let location = touch.location(in: self)
            let touchedNode = atPoint(location)
            if touchedNode.position == continue_button.position{
                if (page == 11){
                    topText.text = "She cried so much that the world can’t stop crying with her"
                    page += 1
                }
                else if (page == 12){
                    topText.text = "To help her out, say things that made you sad today."
                    page += 1
                }
                else if (page == 14){
                    SoundSplash()
                    sadPlant2?.zPosition = -1
                    koiFish?.zPosition = 2
                    blue?.zPosition = 1
                    shape_2.zPosition = 2
                    topText.text = "Great, the spirit of the waters thanks you for making the world stop crying"
                    topText.zPosition = 2
                    page += 1
                }
                else if (page == 15){
                    audioNode2.removeFromParent()
                    let nextScene = SKScene(fileNamed: "HapinessPlantScene")
                    nextScene?.scaleMode = .fill
                    view?.presentScene(nextScene)
                }
            }
            if (page == 13){
                continue_button.zPosition = -1
                shape_3.zPosition = -1
                button2.zPosition = 1
                GameController.shared.TextField.placeholder = "Ex: I was sad that I got a bad grade on the test"
                GameController.shared.appearTextField()
                let location = touch.location(in: self)
                let touchedNode = atPoint(location)
                if touchedNode.position == button2.position{
                    do{
                        let mlModel = try SentimentClassifier_4(configuration: MLModelConfiguration()).model
                        let sentimentPredictor = try NLModel(mlModel: mlModel)
                        let emotion = sentimentPredictor.predictedLabel(for: GameController.shared.TextField.text!)
                            GameController.shared.TextField.text?.removeAll()
                        if (emotion == "sadness"){
                            continue_button.zPosition = 1
                            shape_3.zPosition = 1
                            SoundSparkles()
                            audioNode3.removeFromParent()
                            topText.zPosition = -1
                            button2.zPosition = -1
                            shape_2.zPosition = -1
                            sadPlant?.zPosition = -1
                            sadPlant2?.zPosition = 1
                            rain_21?.zPosition = -1
                            GameController.shared.TextField.isHidden = true
                            button2.zPosition = -1
                            page += 1
                        }
                        else{
                            SoundWrong()
                            topText.fontSize = 40
                            topText.text = "The feeling you are expressing must necessarily be associated with sadness in order to help the plant"
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
