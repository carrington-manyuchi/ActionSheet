//
//  ViewController.swift
//  ActionSheet
//
//  Created by DA MAC M1 157 on 2023/07/08.
//

import UIKit

class ViewController: UIViewController {
    
    // UI obj
    @IBOutlet weak var xLabel: UITextField!
    @IBOutlet weak var yLabel: UITextField!
    @IBOutlet weak var widthLabel: UITextField!
    @IBOutlet weak var heightLabel: UITextField!
    
    var objectToAdd: UIView!
    
    
    //func that adds object to view
    func addObj() {
        
        //if text are empty, turn placeholder to red color
        if xLabel.text!.isEmpty || yLabel.text!.isEmpty || widthLabel.text!.isEmpty || heightLabel.text!.isEmpty {
            
            
            //red placeholder
            xLabel.attributedPlaceholder = NSAttributedString(string: xLabel.placeholder!, attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            yLabel.attributedPlaceholder = NSAttributedString(string: yLabel.placeholder!, attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            widthLabel.attributedPlaceholder = NSAttributedString(string: widthLabel.placeholder!, attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            heightLabel.attributedPlaceholder = NSAttributedString(string: heightLabel.placeholder!, attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            
            return
        } else {
            //shortcuts
            let x = CGFloat(Int(xLabel.text!)!)
            let y = CGFloat(Int(yLabel.text!)!)
            let width = CGFloat(Int(widthLabel.text!)!)
            let height = CGFloat(Int(heightLabel.text!)!)

            
            //Adding coordinates with custom coordinates
            objectToAdd = UIView()
            objectToAdd.frame = CGRect(x: x, y: y, width: width, height: height)
            objectToAdd.backgroundColor = .brown
            objectToAdd.layer.zPosition = -1
            objectToAdd.tag = 1
            objectToAdd.layer.opacity = 0.5
            self.view.addSubview(objectToAdd)
            
            
            //clearing / emptying textfields after adding values
            xLabel.text = ""
            yLabel.text = ""
            widthLabel.text = ""
            heightLabel.text = ""
            
            
            //dismissing the keyboard
            self.view.endEditing(true)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    // fujnction that removes all added object
    func deleteObjects() {
        //objectToAdd.removeFromSuperview()
        
        for view in self.view.subviews {
            /**
            if view.backgroundColor == .brown {
                view.removeFromSuperview()
            }
             **/
            
            if view.tag == 1 {
                view.removeFromSuperview()
            }
        }
        
        
    }

    
    //Called when **actionSheet button is pressed
    @IBAction func btnTapped(_ sender: UIButton) {
        
       //self.addObj()
        let alertController = UIAlertController(title: "Hello, ", message: "Select action", preferredStyle: .actionSheet)
        
        alertController.addAction(UIAlertAction(title: "Add", style: .default) { (action: UIAlertAction) in
            self.addObj()
        })
        
        
        alertController.addAction(UIAlertAction(title: "Delete", style: .destructive) { _ in
            self.deleteObjects()
        })
        
        self.present(alertController, animated: true)
    }
    
}

