//
//  ViewController.swift
//  appIMC
//
//  Created by Bruno Nascimento Marques on 04/01/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfWeight: UITextField!
    @IBOutlet weak var tfHeight: UITextField!
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var ivResult: UIImageView!
    @IBOutlet weak var viResult: UIView!
    
    var imc: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }


    @IBAction func calculate(_ sender: Any) {
        if let weight = Double(tfWeight.text!), let height = Double(tfHeight.text!) {
            imc = weight / (height*height)
            showResults()
            //Na funcao acima fazemos com que os numeros inseridos se tornem numeros decimais (Double), e se isso for feito sera calculado e mostrado os reusltados
            
        }
    }
    
    func showResults() {
        var result: String = ""
        var image: String = ""
        
        switch imc { //E a mesma coisa de um if else, utilizamos ela para que seja conforme o resultado do imc ele nos mostre a imagem e o resultado
            case 0..<16:
                result = "Magreza"
                image = "abaixo"
            case 16..<18.5:
                result = "Abaixo do peso"
                image = "abaixo"
            case 18.5..<25:
                result = "Peso ideal"
                image = "ideal"
            case 25..<30:
                result = "Sobrepeso"
                image = "sobre"
            default:
                result = "Obesidade"
                image = "obesidade"
        }
        
        lbResult.text = "\(Int(imc)): \(result)" //Aqui a label result vai receber o valor de result( que esta no switch acima)
        ivResult.image = UIImage(named: image) //Aqui a imageview vai receber o resultado de image (que esta no switch acima)
        viResult.isHidden = false //Faz com que a parte de resultado apareca apenas quando clicarmos em calcular
        view.endEditing(true) //Aqui quando terminarmos de editar os numeros ele faz a view ficar fisivel, sou seja, tira o foco do teclado no celular
    }
    
    
}

 
