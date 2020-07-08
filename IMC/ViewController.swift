//
//  ViewController.swift
//  IMC
//
//  Created by EPR Exatron on 30/07/18.
//  Copyright © 2018 Exatron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Criação de variáveis
    @IBOutlet weak var tfWeight: UITextField!
    @IBOutlet weak var tfHeight: UITextField!
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var ivResult: UIImageView!
    @IBOutlet weak var viResult: UIView!
    
    var imc: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    @IBAction func calculate(_ sender: Any) {
        
        //Converter o texto digitado para Double
        if let weight = Double(tfWeight.text!), let height = Double(tfHeight.text!){
            imc = weight / pow(height,2)
            print("imc: \(imc)")
            showResults()
        }
    }
        func showResults(){
            var result: String = ""
            var image: String = ""
            
            switch imc {
                
                case 0..<16:
                    result = "Magreza"
                    image = "abaixo"
                break
                
                case 16..<18.5:
                    result = "Abaixo do peso"
                    image = "abaixo"
                break
                
                case 18.5..<25:
                    result = "Peso ideal"
                    image = "ideal"
                break
                
                case 25..<30:
                    result = "Sobrepeso"
                    image = "sobre"
                break
                default:
                    result = "Obesidade"
                    image = "obesidade"
                break
            }
            
            
            //Int -> CONVERTE PARA INTEIRO  
            lbResult.text = "\(Int(imc)): \(result)"
            ivResult.image = UIImage(named: image)
            viResult.isHidden = false
            view.endEditing(true)
            
    }

}














