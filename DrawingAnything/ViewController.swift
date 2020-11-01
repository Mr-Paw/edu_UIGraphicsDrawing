//
//  ViewController.swift
//  DrawingAnything
//
//  Created by paw on 31.10.2020.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func saveAction(_ sender: Any) {
        _ = canvas.takeScreenShot()
       
    }
    @IBOutlet weak var slider: UISlider!
    @IBAction func sliderAction(_ sender: Any) {
        canvas.setLineWidth(CGFloat(slider.value))
    }
    @IBAction func bkueAction(_ sender: Any) {
        canvas.setColor(.blue)
    }
    @IBAction func redAction(_ sender: Any) {
        canvas.setColor(.red)
    }
    @IBAction func yellowAction(_ sender: Any) {
        canvas.setColor(.systemYellow)
    }
    @IBAction func clearAction(_ sender: Any) {
        canvas.clear()
    }
    @IBAction func undoAction(_ sender: Any) {
        canvas.undo()
    }
    @IBOutlet weak var canvas: Canvas!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }


}




