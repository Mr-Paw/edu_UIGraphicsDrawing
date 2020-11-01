//
//  Canvas.swift
//  DrawingAnything
//
//  Created by paw on 31.10.2020.
//

import UIKit

class Canvas: UIView {
    var color = UIColor.red
    var lineWidth: CGFloat = 4
    
    func setColor(_ color: UIColor){
        self.color = color
    }
    func setLineWidth(_ width: CGFloat) {
        self.lineWidth = width
    }
    func undo(){
       _ = lines.popLast()
        setNeedsDisplay()
    }
    func clear() {
        lines.removeAll()
        setNeedsDisplay()
    }
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
       
        lines.forEach { (line) in
            context.setStrokeColor(line.color.cgColor)
            context.setLineWidth(line.stroke)
            context.setLineCap(.round)

            for (i,p) in line.points.enumerated() {
                if i == 0{
                    context.move(to: p)
                } else {
                    context.addLine(to: p)
                }
            }
            context.strokePath()

        }
        
        
    }
    var lines = [Line]()
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lines.append(Line.init(stroke: lineWidth, color: color, points: []))
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: nil) else { return }
        guard var lastLine = lines.popLast() else { return }
        lastLine.points.append(point)
        lines.append(lastLine)
        setNeedsDisplay()
    }

}

extension UIView{
    func takeScreenShot() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        guard (image != nil) else {return nil}
        return image
    }
}

struct Line {
    let stroke: CGFloat
    let color: UIColor
    var points: [CGPoint]
    
}
