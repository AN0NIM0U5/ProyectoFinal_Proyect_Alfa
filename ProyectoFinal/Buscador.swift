//
//  Buscador.swift
//  XAmpyAPP
//
//  Created by Alberto on 11/05/2019.
//  Copyright © 2019 Alberto. All rights reserved.
//

import Foundation
import UIKit

class Buscador: UIView {
    
    let label: UILabel = UILabel()
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }
    
    func configureView() {
        backgroundColor = UIColor.temaColor
        alpha = 0.0
        
        // Configure label
        label.textAlignment = .center
        label.textColor = UIColor.brown
        addSubview(label)
    }
    
    override func draw(_ rect: CGRect) {
        label.frame = bounds
    }
    
    //MARK: - Animation
    
    fileprivate func ocultarPieDePagina() {
        UIView.animate(withDuration: 0.7) {[unowned self] in
            self.alpha = 0.0
        }
    }
    
    fileprivate func verPiePagina() {
        UIView.animate(withDuration: 0.7) {[unowned self] in
            self.alpha = 1.0
        }
    }
}

extension Buscador {
    //MARK: - Public API
    
    public func setFiltros() {
        label.text = ""
                                //verPiePagina()
        ocultarPieDePagina()
    }
    
    public func setFiltradoMostrar(recuentoItemsFiltrados: Int, of recuentoTotal: Int) {
        if (recuentoItemsFiltrados == recuentoTotal) {
            setFiltros()
        } else if (recuentoItemsFiltrados == 0) {
            label.text = "No hay elementos en la busqueda"
            verPiePagina()
        } else {
            label.text = "filtro \(recuentoItemsFiltrados) de \(recuentoTotal)"
            verPiePagina()
        }
    
    }

    

    }
    
    
    
    

