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
    
    @IBOutlet weak var doneButton: UIButton!
    
    var delegate: ColorViewControllerDelegate!
    var backgroundMainVC: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .darkGray
        backgroundChangeView.layer.cornerRadius = 10
        
        let splitUIColor = CIColor(color: backgroundMainVC)
        
        print("red", CGFloat(splitUIColor.red), "green", splitUIColor.green, "blue", splitUIColor.blue)
        
        redSlider.value = Float(splitUIColor.red * 255).rounded()
        greenSlider.value = Float(splitUIColor.green * 255).rounded()
        blueSlider.value = Float(splitUIColor.blue * 255).rounded()
        
        configLabels()
        configButton()
        setBackground()
    }
    
    private func configLabels() {
        redValueLabel.textColor = .white
        greenValueLabel.textColor = .white
        blueValueLabel.textColor = .white
        
        redValueLabel.text = String(Int(redSlider.value.rounded()))
        greenValueLabel.text = String(Int(greenSlider.value.rounded()))
        blueValueLabel.text = String(Int(greenSlider.value.rounded()))
    }
    
    private func configButton() {
        doneButton.backgroundColor = .magenta
        doneButton.layer.cornerRadius = 8
        doneButton.tintColor = .white
    }
    
    private func setBackground() {
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
            greenValueLabel.text = String(Int(greenSlider.value.rounded()))
            break
        case 3:
            blueValueLabel.text = String(Int(blueSlider.value.rounded()))
            break
        default:
            break
        }
        
        setBackground()
    }
    
    @IBAction func saveColor() {
        delegate.saveColor(redColor: CGFloat(round(redSlider.value)/255.0),
                           greenColor: CGFloat(round(greenSlider.value)/255.0),
                           blueColor: CGFloat(round(blueSlider.value)/255.0))
        
        dismiss(animated: true)
    }
}

