//
//  MainViewController.swift
//  colorView
//
//  Created by  Vadim Tatarchuk on 02.11.2020.
//

import UIKit

protocol ColorViewControllerDelegate {
    func saveColor(redColor: CGFloat, greenColor: CGFloat, blueColor: CGFloat)
}

class MainScreenViewController: UIViewController {
    var bgColor: UIColor = .white
    
    override func viewDidLoad () {
        super.viewDidLoad()
        
        navigationConfig()
        
        view.backgroundColor = bgColor
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! ColorViewController
        destination.delegate = self
        destination.backgroundMainVC = bgColor
        
    }
    
    private func navigationConfig() {
        navigationItem.title = "Change color App"
        
    }
}

extension MainScreenViewController: ColorViewControllerDelegate {
    func saveColor(redColor: CGFloat = 1, greenColor: CGFloat = 1, blueColor: CGFloat = 1) {
        bgColor = UIColor(red: redColor, green: greenColor, blue: blueColor, alpha: 1.0)
        view.backgroundColor = bgColor
    }
}

