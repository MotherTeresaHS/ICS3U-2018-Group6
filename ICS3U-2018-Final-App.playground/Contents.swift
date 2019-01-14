
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
        splashSceneBackground.size = CGSize(width: frame.maxX, height: frame.maxY - 200)
        splashSceneBackground.position = CGPoint(x: frame.midX, y: frame.midY - 100)
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
    let creditsButton = SKSpriteNode(imageNamed: "IMG_2458.PNG")
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
        
        creditsButton.name = "credits button"
        creditsButton.position = CGPoint(x: frame.width - 70, y: frame.height - 50)
        creditsButton.size = CGSize(width: frame.size.width, height: frame.size.height)
        creditsButton.setScale(0.35)
        self.addChild(creditsButton)
        creditsButton.zPosition = 3.0
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
            if nodeTouchedName == "credits button" {
                self.menuScreenBackground.removeAllActions()
                let creditsScene = CreditsScene(size: self.size)
                self.view!.presentScene(creditsScene)
            }
        }
    }
    // end of scene
}

class CreditsScene : SKScene {
    // local variables to this scene
    let creditsLabel = SKLabelNode(fontNamed: "Avenir-BlackOblique")
    let spriteCreditsLabel = SKLabelNode(fontNamed: "Avenir-BlackOblique")
    let codingCreditsLabel = SKLabelNode(fontNamed: "Avenir-BlackOblique")
    let menuButton = SKSpriteNode(imageNamed: "IMG_2430.PNG")
    let moveToNextSceneDelay = SKAction.wait(forDuration: 1)
    
    override func didMove(to view: SKView) {
        // this is run when the scene loads
        
        /* Setup your scene here */
        self.backgroundColor = SKColor(red: 0.0, green:0.0, blue:0.0, alpha: 1.0)
        
        creditsLabel.text = "CREDITS"
        creditsLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        creditsLabel.fontColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        creditsLabel.fontSize = 50
        creditsLabel.position = CGPoint(x: frame.midX, y: frame.height - 50)
        self.addChild(creditsLabel)
        creditsLabel.zPosition = 1.0
        
        spriteCreditsLabel.text = "Ninja and Robot sprites thanks to https://www.gameart2d.com/freebies.html"
        spriteCreditsLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        spriteCreditsLabel.fontColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        spriteCreditsLabel.fontSize = 20
        spriteCreditsLabel.position = CGPoint(x: frame.midX, y: frame.height - 120)
        self.addChild(spriteCreditsLabel)
        spriteCreditsLabel.zPosition = 1.0
        
        codingCreditsLabel.text = "Game and artwork made by Amin Zeina and Ethan Bellem"
        codingCreditsLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        codingCreditsLabel.fontColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        codingCreditsLabel.fontSize = 20
        codingCreditsLabel.position = CGPoint(x: frame.midX, y: frame.height - 170)
        self.addChild(codingCreditsLabel)
        codingCreditsLabel.zPosition = 1.0
        
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
        // when touch is released
        var touch = touches as! Set<UITouch>
        var location = touch.first!.location(in: self)
        var nodeTouched = self.atPoint(location)
        
        // when the menu button is touched, it moves to the main menu
        if let nodeTouchedName = nodeTouched.name {
            if nodeTouchedName == "menu button" {
                self.creditsLabel.removeAllActions()
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
    
    let scoreLabel = SKLabelNode(fontNamed: "Avenir-BlackOblique")
    let highscoreLabel = SKLabelNode(fontNamed: "Avenir-BlackOblique")
    
    let moveToNextSceneDelay = SKAction.wait(forDuration: 1)
    let changeAnimationImageDelay = SKAction.wait(forDuration: 1.5)
    
    var score : Int = 0
    var highscoreValue : Int = 0
    var enemies = [SKSpriteNode]()
    var bullets = [SKSpriteNode]()
    var enemySpeedRate : Double = 1.00
    let ninjaIdleArray : [SKTexture] = [SKTexture(imageNamed: "Ni1.png"),
                                        SKTexture(imageNamed: "Ni2.png"),
                                        SKTexture(imageNamed: "Ni3.png"),
                                        SKTexture(imageNamed: "Ni4.png"),
                                        SKTexture(imageNamed: "Ni5.png"),
                                        SKTexture(imageNamed: "Ni6.png"),
                                        SKTexture(imageNamed: "Ni7.png"),
                                        SKTexture(imageNamed: "Ni8.png"),
                                        SKTexture(imageNamed: "Ni9.png"),
                                        SKTexture(imageNamed: "Ni10.png")
                                        ]
    let ninjaThrowArray : [SKTexture] = [SKTexture(imageNamed: "Nt1.png"),
                                        SKTexture(imageNamed: "Nt2.png"),
                                        SKTexture(imageNamed: "Nt3.png"),
                                        SKTexture(imageNamed: "Nt4.png"),
                                        SKTexture(imageNamed: "Nt5.png"),
                                        SKTexture(imageNamed: "Nt6.png"),
                                        SKTexture(imageNamed: "Nt7.png"),
                                        SKTexture(imageNamed: "Nt8.png"),
                                        SKTexture(imageNamed: "Nt9.png"),
                                        SKTexture(imageNamed: "Nt10.png")
                                        ]
    
    let enemyWalkingArray : [SKTexture] = [SKTexture(imageNamed: "Rw1.png"),
                                        SKTexture(imageNamed: "Rw2.png"),
                                        SKTexture(imageNamed: "Rw3.png"),
                                        SKTexture(imageNamed: "Rw4.png"),
                                        SKTexture(imageNamed: "Rw5.png"),
                                        SKTexture(imageNamed: "Rw6.png"),
                                        SKTexture(imageNamed: "Rw7.png"),
                                        SKTexture(imageNamed: "Rw8.png")
                                        ]
    
    // for collision detection
    let collisionBulletCategory: UInt32    = 1
    let collisionEnemyCategory: UInt32     = 2
    let collisionNinjaCategory: UInt32     = 4
    
    override func didMove(to view: SKView) {
        // this is run when the scene loads
        
        // will save highscore to ipad
        let highscore = UserDefaults.standard.integer(forKey: "highscore")
        highscoreValue = highscore
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
        ninja.yScale = 1.6
        ninja.xScale = 0.8
        ninja.physicsBody?.isDynamic = true
        ninja.physicsBody = SKPhysicsBody(texture: ninja.texture!, size: ninja.size)
        ninja.physicsBody?.affectedByGravity = false
        ninja.physicsBody?.usesPreciseCollisionDetection = true
        ninja.physicsBody?.categoryBitMask = collisionNinjaCategory
        ninja.physicsBody?.contactTestBitMask = collisionEnemyCategory
        ninja.physicsBody?.collisionBitMask = 0x0
        self.addChild(ninja)
        ninja.zPosition = 6.0
        
        shootRight.name = "shoot right"
        shootRight.position = CGPoint(x: frame.midX + 400, y: frame.minY + 80)
        shootRight.setScale(0.4)
        shootRight.alpha = 0.8
        self.addChild(shootRight)
        shootRight.zPosition = 5.0
        
        shootLeft.name = "shoot left"
        shootLeft.position = CGPoint(x: frame.midX - 400, y: frame.minY + 80)
        shootLeft.setScale(0.4)
        shootRight.alpha = 0.8
        self.addChild(shootLeft)
        shootLeft.zPosition = 4.0
        
        scoreLabel.text = "Score:" + String(score)
        scoreLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        scoreLabel.fontColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        scoreLabel.fontSize = 50
        scoreLabel.position = CGPoint(x: 25, y: frame.size.height - 50)
        self.addChild(scoreLabel)
        scoreLabel.zPosition = 2.0
        
        highscoreLabel.text = "Highscore: " + String(highscoreValue)
        highscoreLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.right
        highscoreLabel.fontColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        highscoreLabel.fontSize = 50
        highscoreLabel.position = CGPoint(x: frame.width - 25 , y: frame.height - 50)
        self.addChild(highscoreLabel)
        highscoreLabel.zPosition = 3.0
        
        // animate ninja
        let animateNinjaIdle = SKAction.repeatForever(SKAction.animate(with: ninjaIdleArray, timePerFrame: 0.1))
        ninja.run(animateNinjaIdle)
    }
    
    override func  update(_ currentTime: TimeInterval) {
        //
        
        let spawnEnemyChance = Double(arc4random_uniform(100) + 1)
        if spawnEnemyChance <= enemySpeedRate {
            spawnEnemy()
        }
        
        // remove off screen missiles
        for aBullet in bullets {
            if aBullet.position.x < frame.minX - 100 || aBullet.position.x > frame.maxX +  100 {
                aBullet.removeFromParent()
                bullets.removeFirst()
            }
        }
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        // check if contact occured
        let secondNode = contact.bodyB.node as! SKSpriteNode
        
        // check if bullet hit enemy
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
            
            // speed up enemies
            enemySpeedRate += 0.25
            
            if score > highscoreValue {
                highscoreValue = score
                highscoreLabel.text = "Highscore: " + String(highscoreValue)
                UserDefaults().set(highscoreValue, forKey: "highscore")
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
        // when touch beings
        var touch = touches as! Set<UITouch>
        var location = touch.first!.location(in: self)
        var nodeTouched = self.atPoint(location)
        
        // check if shoot but†ons were clicked
        if let nodeTouchedName = nodeTouched.name{
            if nodeTouchedName == "shoot right" || nodeTouchedName == "shoot left"  {
                // animate ninja
                //ninja.removeAllActions()
                let animateNinjaThrow = SKAction.animate(with: ninjaThrowArray, timePerFrame: 0.15)
                ninja.run(animateNinjaThrow)
                
                // shoot bullet
                let aBullet = SKSpriteNode(imageNamed: "IMG_2623.PNG")
                aBullet.position = CGPoint(x: frame.midX, y: frame.minY + 200)
                aBullet.zPosition = 8.0
                aBullet.name = "single bullet"
                aBullet.physicsBody?.isDynamic = true
                aBullet.physicsBody = SKPhysicsBody(texture: aBullet.texture!, size: aBullet.size)
                aBullet.physicsBody?.affectedByGravity = false
                aBullet.physicsBody?.usesPreciseCollisionDetection = true
                aBullet.physicsBody?.categoryBitMask = collisionBulletCategory
                aBullet.physicsBody?.contactTestBitMask = collisionEnemyCategory
                aBullet.physicsBody?.collisionBitMask = 0x0
                self.addChild(aBullet)
                aBullet.setScale(0.5)
                bullets.append(aBullet)
                
                //make sound
                aBullet.run(SKAction.playSoundFileNamed("laser1.wav", waitForCompletion: false))
                
                // check to shoot left or right
                if nodeTouchedName == "shoot left" {
                    // flip bullet and ninja
                    aBullet.xScale = -0.5
                    ninja.xScale = -1.2
                    let shootBullet = SKAction.moveTo(x: frame.minX - 200, duration: 1)
                    aBullet.run(shootBullet)
                    // reset ninja size after switching sprit set
                    ninja.run(changeAnimationImageDelay){
                        self.ninja.xScale = -0.8
                    }
                } else if nodeTouchedName == "shoot right" {
                    let shootBullet = SKAction.moveTo(x: frame.maxX + 200, duration: 1)
                    // flip ninja
                    ninja.xScale = 1.2
                    aBullet.run(shootBullet)
                    // reset ninja size after switching sprit set
                    ninja.run(changeAnimationImageDelay){
                        self.ninja.xScale = 0.8
                    }
                }
                
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
        aSingleEnemy.setScale(1.45)
        let enemySpawnSide = Int(arc4random_uniform(2))
        var enemyStartPostitionX = 0
        if enemySpawnSide == 0 {
            // spawn enemy on left side of screen, 100 pixels off
            enemyStartPostitionX = -100
        } else if enemySpawnSide == 1 {
            // spawn enemy on right side of screen, 100 pixels off
            enemyStartPostitionX = Int(frame.width + 100) 
            // flip image to face center
             aSingleEnemy.xScale = -1.45
        }
        
        aSingleEnemy.position = CGPoint(x: enemyStartPostitionX, y: Int(frame.minY + 200))
        aSingleEnemy.zPosition = 9.0
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
        
        // animate enemy
        let animateEnemyWalk = SKAction.repeatForever(SKAction.animate(with: enemyWalkingArray, timePerFrame: 0.1))
        aSingleEnemy.run(animateEnemyWalk)
    }
    // end of scene
}

class GameOverScene : SKScene {
    // local variables to this scene
    let gameOverLabel = SKLabelNode(fontNamed: "Avenir-BlackOblique")
    let menuButton = SKSpriteNode(imageNamed: "IMG_2430.PNG")
    let moveToNextSceneDelay = SKAction.wait(forDuration: 1)
    
    override func didMove(to view: SKView) {
        // this is run when the scene loads
        
        /* Setup your scene here */
        self.backgroundColor = SKColor(red: 0.0, green:0.0, blue:0.0, alpha: 1.0)
        
        gameOverLabel.text = "Game Over"
        gameOverLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        gameOverLabel.fontColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        gameOverLabel.fontSize = 60
        gameOverLabel.position = CGPoint(x: frame.midX - 150, y: frame.maxY - 150 )
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
