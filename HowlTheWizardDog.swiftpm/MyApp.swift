import SwiftUI
import AVFAudio
import CoreML
@main
struct MyApp: App {
    init() {
        let fontURL = Bundle.main.url(forResource: "Cutesy", withExtension: "ttf")!
        CTFontManagerRegisterFontsForURL(fontURL as CFURL, CTFontManagerScope.process, nil)
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
