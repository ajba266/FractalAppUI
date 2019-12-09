
import UIKit

class Sierpinski: UIView {



    override init(frame: CGRect) {
        super.init(frame: frame)

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }

    override func draw(_ rect: CGRect) {
        // Just so the triangle isn't totally edge to edge, let's give it a 10 point padding
        let inset: CGFloat = 10

        // We need to draw an equilateral triange, so we'll get the top middle, bottom left, and bottom right
        // Currently, this assumes our frame is a square
        let top = CGPoint(x: bounds.midX - inset, y: inset)
        let left = CGPoint(x: inset, y: bounds.maxY - inset)
        let right = CGPoint(x: bounds.maxX - inset, y: bounds.maxY - inset)

        // Since drawTriangle is a recursive function (meaning it calls itself),
        // all we need to do is kick off the first call and it will handle the rest
        drawTriangle(top: top, left: left, right: right)
    }

    func drawTriangle(top: CGPoint, left: CGPoint, right: CGPoint) {
        
        // This first statement is arguably the most important
        // Since this function calls itself over and over, it
        // needs to know when to stop. Otherwise, your computer
        // would eventually run out of memory and Xcode would crash
        guard abs(top.x - left.x) > 3 else { return }

        // The next step is to define the path of the triangle we're currently
        // asked to draw. This is pretty simple, just create a path that starts
        // at the top and draws to each point, coming back to the top at the end
        let path = UIBezierPath()
        path.move(to: top)
        path.addLine(to: left)
        path.addLine(to: right)
        path.addLine(to: top)
        path.close()

        // To make sure we can see the path, give it a width of 1 point and set
        // the color to white
        path.lineWidth = 1
        UIColor.white.setStroke()
        let hue: CGFloat = (205 - (bounds.midX - top.x) / 5) / 360
        UIColor(hue: hue, saturation: 74 / 100, brightness: 100 / 100, alpha: 1).setFill()

        // Draw!
        path.stroke()
        path.fill()

        // At this point we have drawn our triangle. If we just `return`ed now, we would
        // have a basic equilateral triangle. However, if we want to draw a true sierpinski
        // triangle, we must continue!

        // Here we will calculate the midpoint on each line of the triangle we just drew
        // The midpoint() function simply calculates the midpoints using the midpoint formula
        let midLeft = midpoint(from: top, to: left)
        let midRight = midpoint(from: top, to: right)
        let midBottom = midpoint(from: left, to: right)

        // This is the middle, which we are going to exclude
        // If you uncomment this line, what you'll see is just
        // a simple grid of triangles, not a true sierpinski triangle
//        drawTriangle(top: midBottom, left: midLeft, right: midRight)
    
        // Top triangle
        drawTriangle(top: top, left: midLeft, right: midRight)

        // Left triangle
        drawTriangle(top: midLeft, left: left, right: midBottom)

        // Right triangle
        drawTriangle(top: midRight, left: midBottom, right: right)
    }

    fileprivate func midpoint(from start: CGPoint, to end: CGPoint) -> CGPoint {
        let x = (end.x + start.x) / 2
        let y = (end.y + start.y) / 2
        return CGPoint(x: x, y: y)
    }
}

let sierpinski = Sierpinski(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
