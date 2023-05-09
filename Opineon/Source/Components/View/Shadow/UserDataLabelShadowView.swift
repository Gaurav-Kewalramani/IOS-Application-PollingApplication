//
//  UserDataLabelShadowView.swift
//  Opineon
//
//  Created by Aniket Kumar on 23/01/23.
//

import UIKit

class UserDataLabelShadowView: UIView {

    private var shadowLayer: CAShapeLayer!

    //MARK: - Creating shadow for "Home" storyboard navigation UIView
    
    override func layoutSubviews() {
        super.layoutSubviews()

        if shadowLayer == nil {
            self.backgroundColor = UIColor(named: "Background")
            shadowLayer = CAShapeLayer()
            shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: 1).cgPath
            shadowLayer.fillColor = UIColor(named: "BottomViewColor")?.cgColor
            shadowLayer.shadowColor = UIColor.white.cgColor
            shadowLayer.shadowPath = shadowLayer.path
            shadowLayer.shadowOffset = CGSize(width: 2.0, height: 2.0)
            shadowLayer.shadowOpacity = 0.8
            shadowLayer.shadowRadius = 10
            layer.insertSublayer(shadowLayer, at: 0)
        }
    }

}
