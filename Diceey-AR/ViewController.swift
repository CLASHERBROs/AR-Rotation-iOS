//
//  ViewController.swift
//  Diceey-AR
//
//  Created by paritosh on 17/04/20.
//  Copyright © 2020 paritosh. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let animation = CABasicAnimation(keyPath: "rotate")
//        animation.fromValue = 0.0
//        animation.toValue = 100.0
//        animation.duration = 1.0
//        animation.autoreverses = true
//        animation.repeatCount = .infinity
       
      
        
        
        // Set the view's delegate
        sceneView.delegate = self
        //creating a object //units are meter
        let cube = SCNBox(width:0.1 , height: 0.1, length: 0.1, chamferRadius: 0.02)
        let sphere = SCNSphere(radius: 0.2)
let material = SCNMaterial()
        material.diffuse.contents = UIColor.red
        let material2 = SCNMaterial()
        material2.diffuse.contents = UIImage(imageLiteralResourceName:"8k_moon")
        sphere.materials = [material2]
        let node2 = SCNNode()
        node2.position = SCNVector3(0.2,0.6,-0.5)
        node2.geometry = sphere
        //adding animated rotation
        let anim = CABasicAnimation(keyPath: "rotation")
         anim.fromValue = NSValue(scnVector4: SCNVector4(x: 0, y: 1, z: 0, w: 0))
         anim.toValue = NSValue(scnVector4: SCNVector4(x: 0, y: 1, z: 0, w: Float(2 * Double.pi)))
         anim.duration = 60
         anim.repeatCount = .infinity
        node2.addAnimation(anim, forKey: "spin around")
//animation code ending
        
       
        
        cube.materials = [material]
        let node = SCNNode()
        node.position = SCNVector3(0, -0.5, -0.5)
        node.geometry = cube
        sceneView.scene.rootNode.addChildNode(node)
        sceneView.scene.rootNode.addChildNode(node2)
        
        sceneView.autoenablesDefaultLighting = true  //adds light
        // Show statistics such as fps and timing information
      //  sceneView.showsStatistics = true
        
        // Create a new scene
//        let scene = SCNScene(named: "art.scnassets/ship.scn")!
//
//        // Set the scene to the view
//        sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

   
}
