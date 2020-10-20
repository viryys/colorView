//
//  ViewController.swift
//  colorView
//
//  Created by  Vadim Tatarchuk on 18.10.2020.
//

import UIKit

class ColorViewController: UIViewController {

    @IBOutlet weak var backgroundChangeView: UIView!
    
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        backgroundChangeView.layer.cornerRadius = 10
        
        redValueLabel.text = String(Int(redSlider.value.rounded()))
        greenValueLabel.text = String(Int(greenSlider.value.rounded()))
        blueValueLabel.text = String(Int(greenSlider.value.rounded()))
        
        setBackground()
    }
    
    func setBackground() {
        backgroundChangeView.backgroundColor = UIColor(
            red: CGFloat(round(redSlider.value)/255.0),
            green: CGFloat(round(greenSlider.value)/255.0),
            blue: CGFloat(round(blueSlider.value)/255.0),
            alpha: 1.0)
    }

    @IBAction func changeColor(_ sender: UISlider) {
        switch sender.tag {
        case 1:
            redValueLabel.text = String(Int(redSlider.value.rounded()))
            break
        case 2:
            redValueLabel.text = String(Int(redSlider.value.rounded()))
            break
        case 3:
            redValueLabel.text = String(Int(redSlider.value.rounded()))
            break
        default:
            break
        }
        
        setBackground()
    }
}

