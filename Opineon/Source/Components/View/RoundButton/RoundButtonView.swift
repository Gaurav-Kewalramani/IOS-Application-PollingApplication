//
//  RoundButtonView.swift
//  Opineon
//
//  Created by Aniket Kumar on 29/11/22.
//

import UIKit

class RoundButtonView: UIView {

    private var shadowLayer: CAShapeLayer!

    //MARK: - Creating shadow for round button
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if shadowLayer == nil {
            self.backgroundColor = UIColor(named: "BottomViewColor")
            shadowLayer = CAShapeLayer()
            shadowLayer.path = UIBezierPath(ovalIn: CGRect(x: self.frame.size.width/2 - self.frame.size.height/2,y: 0.0, width: self.frame.size.height, height: self.frame.size.height)).cgPath
            shadowLayer.fillColor = UIColor(named: "Background")?.cgColor
            shadowLayer.shadowColor = UIColor(red: 96.0, green: 107.0, blue: 181.0, alpha: 0.1).cgColor
            shadowLayer.shadowPath = shadowLayer.path
            shadowLayer.shadowOffset = CGSize.zero
            shadowLayer.shadowOpacity = 0.015
            shadowLayer.shadowRadius = 12.0
            layer.insertSublayer(shadowLayer, at: 0)
        }
    }
}
