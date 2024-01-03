import SwiftUI
import SpriteKit
import AVKit

struct ContentView: View {
    @State var audioPlayer: AVAudioPlayer!
    
    var gameScene: SKScene {
        let gameScene = SKScene(fileNamed: "GameController")
        gameScene?.scaleMode = .aspectFit

        return gameScene!
      }

    var body: some View {
        GeometryReader { geometry in
            SpriteView(scene: gameScene)
            .frame(width: geometry.size.width, height: geometry.size.height)
        }.edgesIgnoringSafeArea(.all)
        .onAppear {
            let sound = Bundle.main.path(forResource: "background_music", ofType: "mp3")
            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
            self.audioPlayer.numberOfLoops = 4
            self.audioPlayer.play()
        }
    }
}
