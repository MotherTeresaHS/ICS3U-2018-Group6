
// Created on: Dec 2018
// Created by: Ethan Bellem, Amin Zeina
// Created for: ICS3U
// This program is the ICS3U final project

// this will be commented out when code moved to Xcode
import PlaygroundSupport

import SpriteKit

class SplashScene: SKScene {
    // local variables to this scene
    let splashSceneBackground = SKSpriteNode(imageNamed: "splashSceneImage.png")
    let moveToNextSceneDelay = SKAction.wait(forDuration: 1)
    
    override func didMove(to view: SKView) {
        // this is run when the scene loads
        
        /* Setup your scene here */
        self.backgroundColor = SKColor(red: 0.0, green:0.0, blue:0.0, alpha: 1.0)
        
        splashSceneBackground.name = "splash scene background"
        splashSceneBackground.position = CGPoint(x: frame.midX, y: frame.midY)
        splashSceneBackground.size = CGSize(width: frame.size.width, height: frame.size.height)
        self.addChild(splashSceneBackground)
        
        splashSceneBackground.run(moveToNextSceneDelay) {
            //run code here after 3 secs
            
            self.splashSceneBackground.removeAllActions()
            let loadingScene = LoadingScene(size: self.size)
            self.view?.presentScene(loadingScene)
        }
    }
    
    override func  update(_ currentTime: TimeInterval) {
        //
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        //
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //when the screen is touched, it moves to the main menu
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
    }
}

class LoadingScene: SKScene, SKPhysicsContactDelegate {
    // local variables to this scene
    let loadingScreenBackground = SKSpriteNode(imageNamed: "IMG_2340.JPG")
    let moveToNextSceneDelay = SKAction.wait(forDuration: 1.5)
    
    override func didMove(to view: SKView) {
        // this is run when the scene loads
        
        /* Setup your scene here */
        self.backgroundColor = SKColor(red: 1.0, green: 1.0, blue:1.0, alpha: 1.0)
        
        loadingScreenBackground.name = "loading scene background"
        loadingScreenBackground.position = CGPoint(x: frame.midX, y: frame.midY)
        loadingScreenBackground.size = CGSize(width: frame.size.width, height: frame.size.height)
        self.addChild(loadingScreenBackground)
        
        loadingScreenBackground.run(moveToNextSceneDelay) {
            //run code here after 3 secs
            self.loadingScreenBackground.removeAllActions()
            let mainMenuScene = MainMenuScene(size: self.size)
            self.view?.presentScene(mainMenuScene)
        }
    }
    
    override func  update(_ currentTime: TimeInterval) {
        //
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        //
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // when the start button is touched, it moves to the main game
        
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
        
    }
}

class MainMenuScene: SKScene, SKPhysicsContactDelegate {
    // local variables to this scene
    let menuScreenBackground = SKSpriteNode(imageNamed: "IMG_2332.JPG")
    let startButton = SKSpriteNode(imageNamed: "IMG_2367.PNG")
    let moveToNextSceneDelay = SKAction.wait(forDuration: 2.0)
    
    override func didMove(to view: SKView) {
        // this is run when the scene loads
        
        /* Setup your scene here */
        self.backgroundColor = SKColor(red: 1.0, green: 1.0, blue:1.0, alpha: 1.0)
        
        menuScreenBackground.name = "menu scene background"
        menuScreenBackground.position = CGPoint(x: frame.midX, y: frame.midY)
        menuScreenBackground.size = CGSize(width: frame.size.width, height: frame.size.height)
        self.addChild(menuScreenBackground)
        menuScreenBackground.zPosition = 1.0
        
        startButton.name = "start button"
        startButton.position = CGPoint(x: frame.midX, y: 150)
        startButton.size = CGSize(width: frame.size.width, height: frame.size.height)
        startButton.setScale(0.8)
        self.addChild(startButton)
        startButton.zPosition = 2.0
    }
    
    override func  update(_ currentTime: TimeInterval) {
        //
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        //
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        // when the start button is touched, it moves to the main game
        
        var touch = touches as! Set<UITouch>
        var location = touch.first!.location(in: self)
        var nodeTouched = self.atPoint(location)
        
        if let nodeTouchedName = nodeTouched.name {
            if nodeTouchedName == "start button" {
                self.menuScreenBackground.removeAllActions()
                let gameScene = GameScene(size: self.size)
                self.view!.presentScene(gameScene)
            }
        }
    }
    // end of scene
}

class GameScene : SKScene {
    // local variables to this scene
    let gameSceneBackground = SKSpriteNode(imageNamed: "IMG_2332.JPG")
    let moveToNextSceneDelay = SKAction.wait(forDuration: 1)
    
    override func didMove(to view: SKView) {
        // this is run when the scene loads
        
        /* Setup your scene here */
        self.backgroundColor = SKColor(red: 0.0, green:0.0, blue:0.0, alpha: 1.0)
        
        gameSceneBackground.name = "game scene background"
        gameSceneBackground.position = CGPoint(x: frame.midX, y: frame.midY)
        gameSceneBackground.size = CGSize(width: frame.size.width, height: frame.size.height)
        self.addChild(gameSceneBackground)
        
        gameSceneBackground.run(moveToNextSceneDelay) {
            //run code here after 3 secs
            
            self.gameSceneBackground.removeAllActions()
            let gameOverScene = GameOverScene(size: self.size)
            self.view?.presentScene(gameOverScene)
        }
    }
    
    override func  update(_ currentTime: TimeInterval) {
        //
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        //
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //when the screen is touched, it moves to the main menu
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
    }
    // end of scene
}

class GameOverScene : SKScene {
    // local variables to this scene
    let gameOverLabel = SKLabelNode(fontNamed: "chalkduster")
    let menuButton = SKSpriteNode(imageNamed: "IMG_2430.PNG")
    let moveToNextSceneDelay = SKAction.wait(forDuration: 1)
    
    override func didMove(to view: SKView) {
        // this is run when the scene loads
        
        /* Setup your scene here */
        self.backgroundColor = SKColor(red: 0.0, green:0.0, blue:0.0, alpha: 1.0)
        
        gameOverLabel.text = "Game Over"
        gameOverLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        gameOverLabel.fontColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        gameOverLabel.fontSize = 50
        gameOverLabel.position = CGPoint(x: frame.midX - 150, y: 300)
        self.addChild(gameOverLabel)
        gameOverLabel.zPosition = 1.0
        
        menuButton.name = "menu button"
        menuButton.position = CGPoint(x: frame.midX, y: 150)
        menuButton.size = CGSize(width: frame.size.width, height: frame.size.height)
        menuButton.setScale(0.8)
        self.addChild(menuButton)
        menuButton.zPosition = 2.0
        
    }
    
    override func  update(_ currentTime: TimeInterval) {
        //
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        //
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        // when the screen is touched, it moves to the main menu
        
        var touch = touches as! Set<UITouch>
        var location = touch.first!.location(in: self)
        var nodeTouched = self.atPoint(location)
        
        if let nodeTouchedName = nodeTouched.name {
            if nodeTouchedName == "menu button" {
                self.gameOverLabel.removeAllActions()
                let mainMenuScene = MainMenuScene(size: self.size)
                self.view!.presentScene(mainMenuScene)
            }
        }
    }
    // end of scene
}

// this will be commented out when code moved to Xcode

// set the frame to be the size for your iPad

let screenSize = UIScreen.main.bounds
let screenWidth = screenSize.width
let screenHeight = screenSize.height
let frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)

let scene = SplashScene(size: frame.size)
scene.scaleMode = SKSceneScaleMode.resizeFill


let skView = SKView(frame: frame)
skView.showsFPS = true
skView.showsNodeCount = true
skView.presentScene(scene)

PlaygroundPage.current.liveView = skView
