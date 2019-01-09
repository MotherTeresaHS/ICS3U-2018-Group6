
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
        // 
        
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
    let settingsButton = SKSpriteNode(imageNamed: "IMG_2429.PNG")
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
        
        settingsButton.name = "settings button"
        settingsButton.position = CGPoint(x: frame.width - 70, y: frame.height - 50)
        settingsButton.size = CGSize(width: frame.size.width, height: frame.size.height)
        settingsButton.setScale(0.15)
        self.addChild(settingsButton)
        settingsButton.zPosition = 3.0
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
        
        // when the settings button is touch, move to settings menu
        if let nodeTouchedName = nodeTouched.name {
            if nodeTouchedName == "settings button" {
                self.menuScreenBackground.removeAllActions()
                let settingsScene = SettingsScene(size: self.size)
                self.view!.presentScene(settingsScene)
            }
        }
    }
    // end of scene
}

class SettingsScene : SKScene {
    // local variables to this scene
    let settingsLabel = SKLabelNode(fontNamed: "chalkduster")
    let menuButton = SKSpriteNode(imageNamed: "IMG_2430.PNG")
    let moveToNextSceneDelay = SKAction.wait(forDuration: 1)
    
    override func didMove(to view: SKView) {
        // this is run when the scene loads
        
        /* Setup your scene here */
        self.backgroundColor = SKColor(red: 0.0, green:0.0, blue:0.0, alpha: 1.0)
        
        settingsLabel.text = "Settings"
        settingsLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        settingsLabel.fontColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        settingsLabel.fontSize = 50
        settingsLabel.position = CGPoint(x: frame.midX, y: frame.height - 50)
        self.addChild(settingsLabel)
        settingsLabel.zPosition = 1.0
        
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
                self.settingsLabel.removeAllActions()
                let mainMenuScene = MainMenuScene(size: self.size)
                self.view!.presentScene(mainMenuScene)
            }
        }
    }
    // end of scene
}

class GameScene : SKScene, SKPhysicsContactDelegate {
    // local variables to this scene
    let gameSceneBackground = SKSpriteNode(imageNamed: "IMG_2620.JPG")
    var ninja = SKSpriteNode(imageNamed: "IMG_2601.PNG")
    let shootRight = SKSpriteNode(imageNamed: "IMG_2441.PNG")
    let shootLeft = SKSpriteNode(imageNamed: "IMG_2440.PNG")
    let moveToNextSceneDelay = SKAction.wait(forDuration: 1)
    let changeAnimationImageDelay = SKAction.wait(forDuration: 0.1)
    let scoreLabel = SKLabelNode(fontNamed: "chalkduster")
    let highscoreLabel = SKLabelNode(fontNamed: "chalkduster")
    
    var score : Int = 0
    var highscore : Int = 0
    var enemies = [SKSpriteNode]()
    var enemySpeedRate : Int = 1
    
    // for collision detection
    let collisionBulletCategory: UInt32    = 1
    let collisionEnemyCategory: UInt32     = 2
    let collisionNinjaCategory: UInt32     = 4
    
    override func didMove(to view: SKView) {
        // this is run when the scene loads
        
        // will save highscore to ipad
        let highscore = UserDefaults.standard.integer(forKey: "highscore")
        
        self.physicsWorld.contactDelegate = self
        
        /* Setup your scene here */
        self.backgroundColor = SKColor(red: 0.0, green:0.0, blue:0.0, alpha: 1.0)
        
        gameSceneBackground.name = "game scene background"
        gameSceneBackground.position = CGPoint(x: frame.midX, y: frame.midY)
        gameSceneBackground.size = CGSize(width: frame.size.width, height: frame.size.height)
        self.addChild(gameSceneBackground)
        gameSceneBackground.zPosition = 0 
        
        ninja.name = "ninja"
        ninja.position = CGPoint(x: frame.midX, y: frame.minY + 200)
        ninja.setScale(0.4)
        ninja.physicsBody?.isDynamic = true
        ninja.physicsBody = SKPhysicsBody(texture: ninja.texture!, size: ninja.size)
        ninja.physicsBody?.affectedByGravity = false
        ninja.physicsBody?.usesPreciseCollisionDetection = true
        ninja.physicsBody?.categoryBitMask = collisionNinjaCategory
        ninja.physicsBody?.contactTestBitMask = collisionEnemyCategory
        ninja.physicsBody?.collisionBitMask = 0x0
        self.addChild(ninja)
        ninja.zPosition = 5.0
        
        shootRight.name = "shoot right"
        shootRight.position = CGPoint(x: frame.midX + 400, y: frame.minY + 80)
        shootRight.setScale(0.4)
        self.addChild(shootRight)
        shootRight.zPosition = 5.0
        
        shootLeft.name = "shoot left"
        shootLeft.position = CGPoint(x: frame.midX - 400, y: frame.minY + 80)
        shootLeft.setScale(0.4)
        self.addChild(shootLeft)
        shootLeft.zPosition = 5.0
        
        scoreLabel.text = "score:" + String(score)
        scoreLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        scoreLabel.fontColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        scoreLabel.fontSize = 50
        scoreLabel.position = CGPoint(x: 25, y: frame.size.height - 50)
        self.addChild(scoreLabel)
        scoreLabel.zPosition = 2.0
        
        highscoreLabel.text = "Highscore: " + String(highscore)
        highscoreLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.right
        highscoreLabel.fontColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        highscoreLabel.fontSize = 50
        highscoreLabel.position = CGPoint(x: frame.width - 25 , y: frame.height - 50)
        self.addChild(highscoreLabel)
        highscoreLabel.zPosition = 3.0
        
        //gameSceneBackground.run(moveToNextSceneDelay) {
        //run code here after 3 secs
        // self.gameSceneBackground.removeAllActions()
        // let gameOverScene = GameOverScene(size: self.size)
        // self.view?.presentScene(gameOverScene)
        // }
        
    }
    
    override func  update(_ currentTime: TimeInterval) {
        //
        
        let spawnEnemyChance = Int(arc4random_uniform(50) + 1)
        if spawnEnemyChance <= enemySpeedRate {
            spawnEnemy()
        }
        
        // animate ninja idle
        ninja.run(changeAnimationImageDelay){
            var counter : Int = 6
            if counter == 6 {
                self.ninja = SKSpriteNode(imageNamed: "IMG_2601.PNG")
                counter -= 1
            } else if counter == 5 {
                self.ninja = SKSpriteNode(imageNamed: "IMG_2602.PNG")
                counter -= 1
            } else if counter == 4 {
                self.ninja = SKSpriteNode(imageNamed: "IMG_2603.PNG")
                counter -= 1
            } else if counter == 3 {
                self.ninja = SKSpriteNode(imageNamed: "IMG_2604.PNG")
                counter -= 1
            } else if counter == 2 {
                self.ninja = SKSpriteNode(imageNamed: "IMG_2605.PNG")
                counter -= 1
            } else if counter == 1 {
                self.ninja = SKSpriteNode(imageNamed: "IMG_2606.PNG")
                counter -= 1
            }
            if counter <= 0 {
                counter = 6
            }
            
        }
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        // check if contact occured
        let secondNode = contact.bodyB.node as! SKSpriteNode
        
        if ((contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask) == (collisionEnemyCategory | collisionBulletCategory)) {
            
            // show explosion
            var emitterNode = SKEmitterNode(fileNamed: "Copy of Spark.sks")
            emitterNode?.particlePosition = (contact.bodyA.node?.position)!
            self.addChild(emitterNode!)
            self.run(SKAction.wait(forDuration: 2),completion: {emitterNode?.removeFromParent()})
            
            // remove missile and alien
            contact.bodyA.node?.removeFromParent()
            contact.bodyB.node?.removeFromParent()
            ninja.run(SKAction.playSoundFileNamed("BarrelExploding.wav", waitForCompletion: false))
            
            // update score
            score += 2
            
            if score > highscore {
                highscore = score
                highscoreLabel.text = "highscore: " + String(highscore)
                UserDefaults().set(highscore, forKey: "highscore")
            }
            scoreLabel.text = "Score: " + String(score)
        }
        
        if ((contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask) == (collisionEnemyCategory | collisionNinjaCategory)) {
            // check if enemy touches ninja
            
            // show explosion
            var emitterNode = SKEmitterNode(fileNamed: "Copy of Spark.sks")
            emitterNode?.particlePosition = (contact.bodyA.node?.position)!
            self.addChild(emitterNode!)
            self.run(SKAction.wait(forDuration: 2),completion: {emitterNode?.removeFromParent()})
            
            // remove ship and alien
            contact.bodyA.node?.removeFromParent()
            contact.bodyB.node?.removeFromParent() 
            
            // switch scenes
            gameSceneBackground.run(moveToNextSceneDelay){
                let gameOverScene = GameOverScene(size: self.size)
                self.view!.presentScene(gameOverScene)
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        var touch = touches as! Set<UITouch>
        var location = touch.first!.location(in: self)
        var nodeTouched = self.atPoint(location)
        
        if let nodeTouchedName = nodeTouched.name{
            if nodeTouchedName == "shoot right" || nodeTouchedName == "shoot left"  {
                
                // shoot bullet
                let aMissile = SKSpriteNode(imageNamed: "missile.png")
                aMissile.position = CGPoint(x: ship.position.x, y: 100)
                aMissile.zPosition = 6.0
                aMissile.name = "single missile"
                aMissile.physicsBody?.isDynamic = true
                aMissile.physicsBody = SKPhysicsBody(texture: aMissile.texture!, size: aMissile.size)
                aMissile.physicsBody?.affectedByGravity = false
                aMissile.physicsBody?.usesPreciseCollisionDetection = true
                aMissile.physicsBody?.categoryBitMask = collisionMissileCategory
                aMissile.physicsBody?.contactTestBitMask = collisionAlienCategory
                aMissile.physicsBody?.collisionBitMask = 0x0
                self.addChild(aMissile)
                aMissile.setScale(1)
                let shootMissile = SKAction.moveTo(y: frame.size.height + 75, duration: 1)
                aMissile.run(shootMissile)
                missiles.append(aMissile)
                
                //make sound
                aMissile.run(SKAction.playSoundFileNamed("laser1.wav", waitForCompletion: false))
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
    }
    
    func spawnEnemy() {
        let aSingleEnemy = SKSpriteNode(imageNamed: "IMG_2612.PNG")
        let enemySpawnSide = Int(arc4random_uniform(2))
        var enemyStartPostitionX = 0
        if enemySpawnSide == 0 {
            // spawn enemy on left side of screen, 100 pixels off
            enemyStartPostitionX = -100
        } else if enemySpawnSide == 1 {
            // spawn enemy on right side of screen, 100 pixels off
            enemyStartPostitionX = Int(frame.width + 100) 
            // flip image to face center
            aSingleEnemy.xScale = -0.25
        }
        aSingleEnemy.position = CGPoint(x: enemyStartPostitionX, y: Int(frame.minY + 200))
        aSingleEnemy.setScale(0.45)
        aSingleEnemy.zPosition = 4.0
        let enemyMove = SKAction.move(to: CGPoint(x: frame.midX, y: frame.minY + 200), duration: TimeInterval(5 - (enemySpeedRate / 4)))
        aSingleEnemy.run(enemyMove)
        aSingleEnemy.physicsBody?.isDynamic = true
        aSingleEnemy.physicsBody = SKPhysicsBody(texture: aSingleEnemy.texture!, size: aSingleEnemy.size)
        aSingleEnemy.physicsBody?.affectedByGravity = false
        aSingleEnemy.physicsBody?.usesPreciseCollisionDetection = true
        aSingleEnemy.physicsBody?.categoryBitMask = collisionEnemyCategory
        aSingleEnemy.physicsBody?.contactTestBitMask = collisionBulletCategory | collisionNinjaCategory
        aSingleEnemy.physicsBody?.collisionBitMask = 0x0
        self.addChild(aSingleEnemy)
        enemies.append(aSingleEnemy)
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
        gameOverLabel.position = CGPoint(x: frame.midX - 150, y: frame.maxY )
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
