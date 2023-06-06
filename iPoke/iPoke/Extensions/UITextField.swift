//
//  UITextField.swift
//  iPoke
//
//  Created by Yan Alejandro on 06/03/23.
//

import Foundation
import UIKit

extension UITextField{
    
    //MARK: -
    // ESPACO DO LADO ESQUERDO DO TEXTFIELD
    func setLeftPaddingInTextfield(padding: Double) {
        let leftView = UIView()
        leftView.frame = CGRect.init(x: 0.0, y: 0.0, width: padding, height: self.frame.size.height)
        self.leftView = leftView
        self.leftViewMode = .always
    }
    
    //MARK: -
    // ESPACO DO LADO DIREITO DO TEXTFIELD
    func setRightPaddingInTextfield(padding: Double) {
        let rightView = UIView()
        rightView.frame = CGRect.init(x: 0.0, y: 0.0, width: padding, height: self.frame.size.height)
        self.rightView = rightView
        self.rightViewMode = .always
    }
    
    //MARK: -
    // IMAGEM OU ICONE NO LADO DIREITO DO TEXTFIELD
    func setLeftPaddingViewWithImageInTextfield(padding: Double, imageName: String) {
        let leftView = UIView()
        leftView.frame = CGRect.init(x: 0.0, y: 0.0, width: padding+20, height: self.frame.size.height)
        let imgView = UIImageView()
        imgView.frame = CGRect.init(x: 20, y: 10, width: padding-10, height: self.frame.size.height - 20.0)
        imgView.image = UIImage(named: imageName)
        leftView.addSubview(imgView)
        self.leftView = leftView
        self.leftViewMode = .always
    }
    
    //MARK: -
    // TIRA BORDAS DO TEXTFIELD
    func addBottomBorder(){
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: self.frame.size.height - 1, width: self.frame.size.width, height: 1)
        bottomLine.backgroundColor = UIColor.white.cgColor
        borderStyle = .none
        layer.addSublayer(bottomLine)
    }
    
    
}

