//
//  GameScene.swift
//  SampleProject
//
//  Created by Sathish on 21/07/18.
//  Copyright © 2018 Full. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var triangleNode: SKSpriteNode!
    var positionNodes: [SKSpriteNode?] = []
    var starNode: SKSpriteNode!
    
    var goatNodes: [SKSpriteNode?] = []
    
    
    override func didMove(to view: SKView) {
        triangleNode = self.childNode(withName: "Model") as? SKSpriteNode
        positionNodes = [self.childNode(withName: "0") as? SKSpriteNode, self.childNode(withName: "1") as? SKSpriteNode, self.childNode(withName: "2") as? SKSpriteNode, self.childNode(withName: "3") as? SKSpriteNode, self.childNode(withName: "4") as? SKSpriteNode, self.childNode(withName: "5") as? SKSpriteNode, self.childNode(withName: "6") as? SKSpriteNode, self.childNode(withName: "7") as? SKSpriteNode, self.childNode(withName: "8") as? SKSpriteNode,
            self.childNode(withName: "9") as? SKSpriteNode]
        starNode = childNode(withName: "star") as? SKSpriteNode
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first!
        let position = touch.location(in: self)
        
        print("The Position of Touch is \(position)")
        let touchNode = self.atPoint(position)
        print("The Node at position is \(touchNode.name)")
        
        if goatNodes.count < 5 {
            self.placeGoatsFirst(withPosition: position)
            return
        }
        
        guard let name = touchNode.name, let node = self.childNode(withName: name) as? SKSpriteNode else {
            return
        }
        
        guard positionNodes.contains(node) else {
            return
        }
        
        let moveByAction = SKAction.move(to: position, duration: 0.1)
        starNode.run(moveByAction)
    }
    
    func placeGoatsFirst(withPosition position: CGPoint) {
        
        guard self.goatNodes.count < 5 else {
            return
        }
        
        guard let node = SKSpriteNode(imageNamed: "Circle") as? SKSpriteNode else {
            return
        }
        node.position = position
        node.name = "Goat\(goatNodes.count)"
        addChild(node)
        self.goatNodes.append(node)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
