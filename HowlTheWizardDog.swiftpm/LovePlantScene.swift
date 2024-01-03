//
//  LovePlantScene.swift
//  HowlTheWizardDog
//
//  Created by Larissa Okabayashi on 14/04/23.
//

import Foundation
import SpriteKit
import CoreML
import NaturalLanguage

class LovePlantScene: SKScene {
    
    var shape_2 = SKSpriteNode(imageNamed: "shape_2")
    var topText = SKLabelNode(fontNamed: "Cutesy")
    var textAux = SKLabelNode(fontNamed: "Cutesy")
    var tryAgain = SKLabelNode(fontNamed: "Cutesy")
    var about = SKLabelNode(fontNamed: "Cutesy")
    var dog: SKSpriteNode?
    var LovePlant: SKSpriteNode?
    var LovePlant2: SKSpriteNode?
    var LovePlant3: SKSpriteNode?
    var finalDog: SKSpriteNode?
    var button2 = SKSpriteNode(imageNamed: "arrow")
    var sparkles: SKSpriteNode?
    var sun1: SKSpriteNode?
    var pink:SKSpriteNode?
    var love = SKSpriteNode(imageNamed: "love")
    var shape3: SKSpriteNode?
    var shape_3 = SKSpriteNode(imageNamed: "text-2")
    var shape_4 = SKSpriteNode(imageNamed: "text-2")
    var shape_5 = SKSpriteNode(imageNamed: "text-2")
    var shape_6 = SKSpriteNode(imageNamed: "shape_6")
    var continue_button = SKLabelNode(fontNamed: "Cutesy")
    var profile = SKSpriteNode(imageNamed: "image 26")
    var page = 20
    var pass = false
    
    override func didMove(to view: SKView) {
        sun1 = childNode(withName: "sun1") as? SKSpriteNode
        
        LovePlant = childNode(withName: "flower of love 1") as? SKSpriteNode
        
        LovePlant2 = childNode(withName: "flower of love 2") as? SKSpriteNode
        LovePlant2?.zPosition = -1
        
        LovePlant3 = childNode(withName: "vaso") as? SKSpriteNode
        LovePlant3?.zPosition = -1
        
        finalDog = childNode(withName: "finaldog") as? SKSpriteNode
        finalDog?.zPosition = -1
        
        shape3 = childNode(withName: "shape3") as? SKSpriteNode
        shape3?.zPosition = -1

        sparkles = childNode(withName: "sparkles") as? SKSpriteNode
        
        dog = childNode(withName: "dog") as? SKSpriteNode
        
        pink = childNode(withName: "pink") as? SKSpriteNode
        pink?.zPosition = -1

        shape_2.position = CGPoint(x:0, y:400);
        shape_2.size.width = 1258
        shape_2.size.height = 84
        addChild(shape_2)
        
        shape_6.position = CGPoint(x: 0, y: 0)
        shape_6.zPosition = -1
        shape_6.size.width = 1205
        shape_6.size.height = 843
        addChild(shape_6)
        
        profile.position = CGPoint(x:0, y:250);
        profile.size.width = 200
        profile.size.height = 214
        profile.zPosition = -1
        addChild(profile)
        
        topText.text = "For last say all the things that made you feel grateful today";
        topText.fontSize = 50;
        topText.position = CGPoint(x: 0, y: 380)
        topText.fontColor = UIColor.black
        addChild(topText)
        
        textAux.text = "using the power of expressing your feelings"
        textAux.fontSize = 50;
        textAux.position = CGPoint(x: 0, y: 220)
        textAux.fontColor = UIColor.black
        textAux.zPosition = -1
        addChild(textAux)
    
        button2.position = CGPoint(x:550, y:-385)
        button2.size.width = 50
        button2.size.height = 60
        button2.zPosition = -1
        addChild(button2)
        
        love.position = CGPoint(x:0, y:0);
        love.size.width = 400
        love.size.height = 495
        love.zPosition = -1
        addChild(love)
        
        shape_3.position = CGPoint(x:550, y:-440);
        shape_3.size.width = 160
        shape_3.size.height = 50
        addChild(shape_3)
        
        shape_4.position = CGPoint(x:-570, y:-460);
        shape_4.size.width = 160
        shape_4.size.height = 50
        shape_4.zPosition = -1
        addChild(shape_4)
        
        continue_button.text = "Continue"
        continue_button.fontSize = 40;
        continue_button.position = CGPoint(x: 550, y: -452)
        continue_button.fontColor = UIColor.black
        addChild(continue_button)
        
        tryAgain.text = "Try Again!"
        tryAgain.fontSize = 40;
        tryAgain.position = CGPoint(x: -575, y: -472)
        tryAgain.fontColor = UIColor.black
        tryAgain.zPosition = -1
        addChild(tryAgain)
        
        let animationIdle_1: [SKTexture] = [
            SKTexture(imageNamed: "sun1"),
            SKTexture(imageNamed: "sun2"),
            SKTexture(imageNamed: "sun3"),
            SKTexture(imageNamed: "sun4"),
            SKTexture(imageNamed: "sun5"),
        ]
        
        sun1?.run(.repeatForever(.animate(with: animationIdle_1, timePerFrame: 0.5)))
        
        let animationIdle_2: [SKTexture] = [
            SKTexture(imageNamed: "love"),
            SKTexture(imageNamed: "love2")
        ]
        
        love.run(.repeatForever(.animate(with: animationIdle_2, timePerFrame: 0.5)))
        
        let animationIdle_5: [SKTexture] = [
            SKTexture(imageNamed: "pink1"),
            SKTexture(imageNamed: "pink2"),
            SKTexture(imageNamed: "pink3"),
            SKTexture(imageNamed: "pink4")
        ]
        
        pink?.run(.repeatForever(.animate(with: animationIdle_5, timePerFrame: 0.2)))
        
        let animationIdle_3: [SKTexture] = [
            SKTexture(imageNamed: "finaldog1"),
            SKTexture(imageNamed: "finaldog2")
        ]
        
        finalDog?.run(.repeatForever(.animate(with: animationIdle_3, timePerFrame: 0.5)))
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
    
    func SoundWin(){
        let audioNode = SKAudioNode(fileNamed: "win")
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        for touch in touches {
            SoundNextPage()
            let location = touch.location(in: self)
            let touchedNode = atPoint(location)
            if (page == 20 && pass == false){
                shape_3.zPosition = -1
                continue_button.zPosition = -1
                button2.zPosition = 1
                GameController.shared.TextField.placeholder = "Ex: I am grateful for having amazing friends"
                GameController.shared.appearTextField()
                pass = true
            }
            else if (page == 20 && pass == true){
                if touchedNode.position == button2.position{
                    do{
                        let mlModel = try SentimentClassifier_4(configuration: MLModelConfiguration()).model
                        let sentimentPredictor = try NLModel(mlModel: mlModel)
                        let emotion = sentimentPredictor.predictedLabel(for: GameController.shared.TextField.text!)
                        GameController.shared.TextField.text?.removeAll()
                        if (emotion == "love" || emotion == "happy"){
                            shape_2.zPosition = -1
                            button2.removeFromParent()
                            topText.zPosition = -1
                            LovePlant?.removeFromParent()
                            LovePlant3?.zPosition = 1
                            GameController.shared.TextField.isHidden = true
                            continue_button.zPosition = 1
                            shape_3.zPosition = 1
                            page += 1
                        }
                        else{
                            SoundWrong()
                            topText.fontSize = 45
                            topText.text = "It needs to be a positive feeling to activate the power of the plant"
                        }
                    }
                    catch{
                        print(error.localizedDescription)
                    }
                }
            }
            if (touchedNode.position == continue_button.position){
                if (page == 21){
                    SoundSparkles()
                    pink?.zPosition = 2
                    love.zPosition = 3
                    shape_2.zPosition = 3
                    continue_button.zPosition = 3
                    shape_3.zPosition = 3
                    topText.text = "Fantastic, now the world is full of love"
                    topText.zPosition = 3
                    page += 1
                    
                }
                else if (page == 22){
                    SoundWin()
                    love.removeFromParent()
                    shape_2.removeFromParent()
                    shape_3.size.width = 240
                    shape3?.zPosition = 3
                    textAux.zPosition = 3
                    finalDog?.zPosition = 3
                    topText.position = CGPoint(x: 0, y: 250)
                    topText.text = "Thank you so much, you saved the world"
                    continue_button.text = "About The Author"
                    continue_button.position = CGPoint(x: 550, y: -460)
                    page += 1
                }
                else if (page == 23){
                    shape_6.zPosition = 3
                    shape3?.removeFromParent()
                    profile.zPosition = 3
                    finalDog?.removeFromParent()
                    continue_button.text = "Finish"
                    tryAgain.zPosition = 3
                    shape_4.zPosition = 3
                    topText.text = "About the author"
                    topText.position = CGPoint(x: 0, y: 100)
                    textAux.position = CGPoint(x: 0, y: -170)
                    let multiLineString = """
                                      Larissa is a Brazilian curious developer. She is passionate about
                                      creativity, programming, traveling and learning new things.
                                      She is born in Sao Paulo and is currently studying Computer
                                      engineering at Unicamp and is part of the Apple Developer Academy
                                      Campinas team.
                                      """
                    textAux.text = multiLineString
                    textAux.lineBreakMode = .byWordWrapping
                    textAux.numberOfLines = 5
                    textAux.zPosition = 3
                    page += 1
                }
                else if (page == 24){
                    exit(0)
                }
            }
            else if (touchedNode.position == tryAgain.position){
                self.view?.scene?.removeAllChildren()
                let nextScene = SKScene(fileNamed: "GameController")
                nextScene?.scaleMode = .fill
                view?.presentScene(nextScene)
            }
        }
    }
}



