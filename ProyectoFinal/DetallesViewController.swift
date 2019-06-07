
//
//  DetallesViewController.swift
//  PROYECTO_Alfa
//
//  Created by Alberto on 19/05/2019.
//  Copyright © 2019 Alberto. All rights reserved.
//
import UIKit
import Foundation

class DetallesViewController: UIViewController
{
    

    
    
    @IBOutlet weak var detallesDescripcionLabel: UILabel!
    
    @IBOutlet weak var menuImageView: UIImageView!
    
    
    var detallesMenu: Menu? {
        didSet {
            configureView()
        }
    }
    
    
    func configureView() {
        if let detallesMenu = detallesMenu {
            if let detallesDescripcionLabel = detallesDescripcionLabel, let menuImageView = menuImageView {
                detallesDescripcionLabel.text = detallesMenu.nombre
                menuImageView.image = UIImage(named: detallesMenu.nombre)
                title  = detallesMenu.categoria
             
                menuImageView.isUserInteractionEnabled = true
                
                switch detallesMenu.nombre{

                case "ATE": menuImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.segueATE)))
                case "mapView": menuImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.segueMapView)))

                case "Notificaciones Fechas": menuImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.segueANotificacionesFechas)))

                case "WebView": menuImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.segueWebView)))
                default: break
                }
//
//               menuImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.segueWebView)))
            }
        }
    }
    


        @objc func segueWebView() {
            
            performSegue(withIdentifier:"WebView", sender: nil) // web view
        }
        @objc func segueATE() {
            
            performSegue(withIdentifier:"ATE", sender: nil)//imagen Verde
        }

        @objc func segueANotificacionesFechas() {
            
            performSegue(withIdentifier:"Notificaciones Fechas", sender: nil)
        }

        @objc func segueMapView() {
            
            performSegue(withIdentifier:"mapView", sender: nil)
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
}


}



//    @objc func pasarAManualSwift() {
//
//        performSegue(withIdentifier:"manualSwift5", sender: nil)
//    }
//    @objc func pasarAManualSwift() {
//
//        performSegue(withIdentifier:"manualSwift5", sender: nil)
//    }
//    @objc func pasarAManualSwift() {
//
//        performSegue(withIdentifier:"manualSwift5", sender: nil)
//    }
//
        
//                }
//
//
//
//                }
//    }
//
////                     self.performSegue(withIdentifier: "manualSwift5", sender: nil)
////
//    }
//
//

