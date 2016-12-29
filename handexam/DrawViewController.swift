//
//  DrawViewController.swift
//

import UIKit

class DrawViewController: UIViewController {

    @IBOutlet weak var drawImageView: UIImageView!
    
    var lastPoint = CGPoint.zero
    var swiped = false
    
    // var red:CGFloat = 0.0
    // var green:CGFloat = 0.0
    // var blue:CGFloat = 0.0
    
    // var isDrawing = true
    
    // drawing properties
    func drawLines(fromPoint:CGPoint,toPoint:CGPoint) {
        UIGraphicsBeginImageContext(self.view.frame.size)
        drawImageView.image?.draw(in: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        let context = UIGraphicsGetCurrentContext()
        
        context?.move(to: CGPoint(x: fromPoint.x, y: fromPoint.y))
        context?.addLine(to: CGPoint(x: toPoint.x, y: toPoint.y))
        
        context?.setBlendMode(CGBlendMode.normal)
        context?.setLineCap(CGLineCap.round)
        context?.setLineWidth(5)
        //context?.setStrokeColor(UIColor(red: red, green: green, blue: blue, alpha: 1.0).cgColor)
        context?.setStrokeColor(UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0).cgColor)
        
        context?.strokePath()
        
        drawImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    // store the last touched point coordinate in the board
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = false
        
        if let touch = touches.first {
            lastPoint = touch.location(in: self.view)
        }
    }
    
    // run continuously as long as the finger is moving
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        // draw continuous dots instead of a single point
        swiped = true
        
        // continuously catch the current point as you move and draw a line
        if let touch = touches.first {
            let currentPoint = touch.location(in: self.view)
            drawLines(fromPoint: lastPoint, toPoint: currentPoint)
            
            lastPoint = currentPoint
        }
    }
    
    // notify the controller each time you release the finger off the screen
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !swiped {
            drawLines(fromPoint: lastPoint, toPoint: lastPoint)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
