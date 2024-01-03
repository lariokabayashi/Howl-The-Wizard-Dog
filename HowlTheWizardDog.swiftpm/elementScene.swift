//
//  elementScene.swift
//  HowlTheWizardDog
//
//  Created by Larissa Okabayashi on 11/04/23.
//

import Foundation
import SpriteKit

class elementScene: SKScene {
    var fire_demon: SKSpriteNode?
    var shape_2 = SKSpriteNode(imageNamed: "shape_2")
    var topText = SKLabelNode(fontNamed: "Cutesy")
    var page = 9
    var red: SKSpriteNode?
    let audioNodeFire = SKAudioNode(fileNamed: "SoundFire")
    var shape_3 = SKSpriteNode(imageNamed: "text-2")
    var continue_button = SKLabelNode(fontNamed: "Cutesy")
    
    func SoundNextPage(){
        let audioNode = SKAudioNode(fileNamed: "soundNext")
        audioNode.autoplayLooped = false
        self.addChild(audioNode)
        let playAction = SKAction.play()
        audioNode.run(playAction)
    }
    
    func soundFire(){
        audioNodeFire.autoplayLooped = false
        self.addChild(audioNodeFire)
        let playAction = SKAction.play()
        audioNodeFire.run(playAction)
    }
    
    override func didMove(to view: SKView) {
        red = childNode(withName: "red") as? SKSpriteNode
        
        soundFire()
        
        fire_demon = childNode(withName: "fire_demon") as? SKSpriteNode
        
        let animationIdle_2: [SKTexture] = [
            SKTexture(imageNamed: "fire_demon"),
            SKTexture(imageNamed: "fire_demon_2"),
            SKTexture(imageNamed: "fire_demon_3")
        ]
        fire_demon?.run(.repeatForever(.animate(with: animationIdle_2, timePerFrame: 0.2)))
        
        let animationIdle_3: [SKTexture] = [
            SKTexture(imageNamed: "red1"),
            SKTexture(imageNamed: "red2"),
            SKTexture(imageNamed: "red3"),
            SKTexture(imageNamed: "red4")
        ]
        
        red?.run(.repeatForever(.animate(with: animationIdle_3, timePerFrame: 0.2)))
        
        shape_2.position = CGPoint(x:0, y:400);
        shape_2.size.width = 1258
        shape_2.size.height = 84
        shape_2.zPosition = 1
        addChild(shape_2)
        
        topText.text = "Perfect, you did a great job calming the fire spirit";
        topText.fontSize = 50;
        topText.position = CGPoint(x: 0, y: 380)
        topText.fontColor = UIColor.black
        topText.zPosition = 1
        addChild(topText)
        
        shape_3.position = CGPoint(x:550, y:-440);
        shape_3.size.width = 160
        shape_3.size.height = 50
        addChild(shape_3)
        
        continue_button.text = "Continue"
        continue_button.fontSize = 40;
        continue_button.position = CGPoint(x: 550, y: -452)
        continue_button.fontColor = UIColor.black
        addChild(continue_button)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            SoundNextPage()
            let location = touch.location(in: self)
            let touchedNode = atPoint(location)
            if (touchedNode.position == continue_button.position){
                if (page == 9){
                    audioNodeFire.removeFromParent()
                    let nextScene = SKScene(fileNamed: "SadnessPlantScene")
                    nextScene?.scaleMode = .fill
                    view?.presentScene(nextScene)
                }
            }
        }
    }
}
