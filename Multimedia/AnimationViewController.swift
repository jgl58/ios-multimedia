//
//  AnimationViewController.swift
//  Multimedia
//
//  Created by Jonay Gilabert López on 27/01/2020.
//  Copyright © 2020 Jonay Gilabert López. All rights reserved.
//

import UIKit
import QuartzCore

class AnimationViewController: UIViewController {

     var capaPortada: CALayer!
       @IBOutlet weak var btVenAqui: UIButton!
       
       override func viewDidLoad() {
       
               super.viewDidLoad()
               // Do any additional setup after loading the view, typically from a nib.
           
               self.capaPortada = CALayer()
               self.capaPortada.position = self.view.center
               self.capaPortada.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
               self.capaPortada.cornerRadius = 10
               self.capaPortada.borderWidth = 2
               self.capaPortada.backgroundColor = UIColor.white.cgColor
               self.capaPortada.borderColor = UIColor.gray.cgColor
           
               
               self.capaPortada.contents = (UIImage(named: "resplandor.jpg")!.cgImage! as Any)
               self.capaPortada.contentsGravity = CALayerContentsGravity.resizeAspect
               
               self.view.layer.addSublayer(self.capaPortada)
       }

       override func didReceiveMemoryWarning() {
           super.didReceiveMemoryWarning()
           // Dispose of any resources that can be recreated.
       }

       @IBAction func actionMoverAqui(_ sender: UIButton) {
           // TODO (b) Hacer que la capa con la imagen de la pelicula (self.capaPortada) se mueva a la posición que ocupa el botón pulsado (sender.center) de forma animada
           self.capaPortada.position = sender.center
           
       }
}
