//
//  ViewController.swift
//  colorView
//
//  Created by  Vadim Tatarchuk on 18.10.2020.
//

import UIKit

class ColorViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var backgroundChangeView: UIView!
    
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    
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
        configTextFields()
        configButton()
        setBackground()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == redTextField {
            textField.resignFirstResponder()
            greenTextField.becomeFirstResponder()
        } else if textField == greenTextField {
            textField.resignFirstResponder()
            blueTextField.becomeFirstResponder()
        } else if textField == blueTextField {
            saveColor()
        }
        return true
    }
    
    private func configTextFields() {
        redTextField.backgroundColor = .white
        greenTextField.backgroundColor = .white
        blueTextField.backgroundColor = .white
        
        redTextField.returnKeyType = UIReturnKeyType.next
        greenTextField.returnKeyType = UIReturnKeyType.next
        blueTextField.returnKeyType = UIReturnKeyType.done
        
        redTextField.text = String(Int(redSlider.value.rounded()))
        greenTextField.text = String(Int(greenSlider.value.rounded()))
        blueTextField.text = String(Int(blueSlider.value.rounded()))
    }
    
    private func configLabels() {
        redValueLabel.textColor = .white
        greenValueLabel.textColor = .white
        blueValueLabel.textColor = .white
        
        redValueLabel.text = String(Int(redSlider.value.rounded()))
        greenValueLabel.text = String(Int(greenSlider.value.rounded()))
        blueValueLabel.text = String(Int(blueSlider.value.rounded()))
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
            redTextField.text = String(Int(redSlider.value.rounded()))
            break
        case 2:
            greenValueLabel.text = String(Int(greenSlider.value.rounded()))
            greenTextField.text = String(Int(greenSlider.value.rounded()))
            break
        case 3:
            blueValueLabel.text = String(Int(blueSlider.value.rounded()))
            blueTextField.text = String(Int(blueSlider.value.rounded()))
            break
        default:
            break
        }
        
        setBackground()
    }
    
    @IBAction func submitTextFIeld(_ sender: UITextField) {
        print(sender.tag)
    }
    
    @IBAction func saveColor() {
        
        delegate.saveColor(UIColor(
            red: CGFloat(round(redSlider.value)/255.0),
            green: CGFloat(round(greenSlider.value)/255.0),
            blue: CGFloat(round(blueSlider.value)/255.0),
            alpha: 1.0
        ))
        
        dismiss(animated: true)
    }
}

