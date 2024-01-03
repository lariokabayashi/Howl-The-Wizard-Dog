//
//  HapinessPlantScene.swift
//  HowlTheWizardDog
//
//  Created by Larissa Okabayashi on 14/04/23.
//

import Foundation
import SpriteKit
import CoreML
import NaturalLanguage

class HapinessPlantScene: SKScene {
    
    var background: SKSpriteNode?
    var shape_2 = SKSpriteNode(imageNamed: "shape_2")
    var topText = SKLabelNode(fontNamed: "Cutesy")
    var dog: SKSpriteNode?
    var HapinessPlant: SKSpriteNode?
    var HapinessPlant2: SKSpriteNode?
    var HapinessPlant3: SKSpriteNode?
    var button2 = SKSpriteNode(imageNamed: "arrow")
    var sparkles = SKSpriteNode(imageNamed: "sparkles")
    var sun: SKSpriteNode?
    var page = 16
    var shape_3 = SKSpriteNode(imageNamed: "text-2")
    var continue_button = SKLabelNode(fontNamed: "Cutesy")
    
    override func didMove(to view: SKView) {
        
        background = childNode(withName: "background") as? SKSpriteNode
        
        sun = childNode(withName: "sun") as? SKSpriteNode
        sun?.zPosition = -1
        
        HapinessPlant = childNode(withName: "flower happy 1") as? SKSpriteNode
        
        HapinessPlant2 = childNode(withName: "flowerhappy 2") as? SKSpriteNode
        HapinessPlant2?.zPosition = -100
        
        HapinessPlant3 = childNode(withName: "flower grow") as? SKSpriteNode
        HapinessPlant3?.zPosition = -100
        
        dog = childNode(withName: "dog") as? SKSpriteNode

        shape_2.position = CGPoint(x:0, y:400);
        shape_2.size.width = 1258
        shape_2.size.height = 84
        addChild(shape_2)
        
        sparkles.position = CGPoint(x: 0, y: 320)
        sparkles.size.width = 1143
        sparkles.size.height = 338
        sparkles.zPosition = -100
        addChild(sparkles)
        
        topText.text = "This is the happiness plant she only grows when you put happy feelings in her !";
        topText.fontSize = 45;
        topText.position = CGPoint(x: 0, y: 380)
        topText.fontColor = UIColor.black
        addChild(topText)
        
        button2.position = CGPoint(x:550, y:-385)
        button2.size.width = 50
        button2.size.height = 60
        button2.zPosition = -100
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
        
        let animationIdle_1: [SKTexture] = [
            SKTexture(imageNamed: "sun1"),
            SKTexture(imageNamed: "sun2"),
            SKTexture(imageNamed: "sun3"),
            SKTexture(imageNamed: "sun4"),
            SKTexture(imageNamed: "sun5"),
        ]
        
        sun?.run(.repeatForever(.animate(with: animationIdle_1, timePerFrame: 0.5)))
        
        let animationIdle_2: [SKTexture] = [
            SKTexture(imageNamed: "sparkles"),
            SKTexture(imageNamed: "sparkles2")
        ]
        
        sparkles.run(.repeatForever(.animate(with: animationIdle_2, timePerFrame: 0.3)))
    }
    
    func SoundNextPage(){
        let audioNode = SKAudioNode(fileNamed: "soundNext")
        audioNode.autoplayLooped = false
        self.addChild(audioNode)
        let playAction = SKAction.play()
        audioNode.run(playAction)
    }
    
    func SoundSparkles(){
        let audioNode2 = SKAudioNode(fileNamed: "sparkles")
        audioNode2.autoplayLooped = false
        self.addChild(audioNode2)
        let playAction = SKAction.play()
        audioNode2.run(playAction)
    }
    
    func SoundWrong(){
        let audioNode = SKAudioNode(fileNamed: "wrong")
        audioNode.autoplayLooped = false
        self.addChild(audioNode)
        let playAction = SKAction.play()
        audioNode.run(playAction)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            SoundNextPage()
            let location = touch.location(in: self)
            let touchedNode = atPoint(location)
            if (touchedNode.position == continue_button.position){
                if (page == 16){
                    topText.fontSize = 50
                    topText.text = "Say the things that made you happy today"
                    page += 1
                }
                else if (page == 18){
                    continue_button.zPosition = 1
                    shape_3.zPosition = 1
                    let nextScene = SKScene(fileNamed: "LovePlantScene")
                    nextScene?.scaleMode = .fill
                    view?.presentScene(nextScene)
                }
            }
            if (page == 17){
                continue_button.zPosition = -1
                shape_3.zPosition = -1
                button2.zPosition = 100
                GameController.shared.TextField.placeholder = "Ex: I was happy today because my mom did a delicious food"
                GameController.shared.appearTextField()
                let location = touch.location(in: self)
                let touchedNode = atPoint(location)
                if touchedNode.position == button2.position{
                    do{
                        let mlModel = try SentimentClassifier_4(configuration: MLModelConfiguration()).model
                        let sentimentPredictor = try NLModel(mlModel: mlModel)
                        let emotion = sentimentPredictor.predictedLabel(for: GameController.shared.TextField.text!)
                        GameController.shared.TextField.text?.removeAll()
                        if (emotion == "happy"){
                            SoundSparkles()
                            GameController.shared.TextField.isHidden = true
                            button2.removeFromParent()
                            topText.zPosition = 100
                            shape_2.zPosition = 100
                            topText.text = "Good job, now the world is fulfilled with happiness"
                            sun?.zPosition = 1
                            HapinessPlant?.removeFromParent()
                            HapinessPlant3?.zPosition = 100
                            background?.removeFromParent()
                            dog?.zPosition = 100
                            sparkles.zPosition = 100
                            continue_button.zPosition = 1
                            shape_3.zPosition = 1
                            page += 1
                        }
                        else{
                            SoundWrong()
                            topText.zPosition = 100
                            shape_2.zPosition = 100
                            topText.fontSize = 45
                            topText.text = "It needs to be a happy feeling to activate the power of the plant"
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

