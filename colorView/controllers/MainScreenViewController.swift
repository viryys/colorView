//
//  MainViewController.swift
//  colorView
//
//  Created by  Vadim Tatarchuk on 02.11.2020.
//

import UIKit

protocol ColorViewControllerDelegate {
    func saveColor(_ bgColor: UIColor)
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
    func saveColor(_ bgColor: UIColor) {
        self.bgColor = bgColor
        view.backgroundColor = bgColor
    }
}

