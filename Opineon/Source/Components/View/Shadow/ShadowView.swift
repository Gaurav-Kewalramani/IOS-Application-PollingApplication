//
//  ShadowView.swift
//  Opineon
//
//  Created by Deepanshu Agarwal on 25/11/22.
//

import UIKit



class ShadowView: UIView {

    private var shadowLayer: CAShapeLayer!

    //MARK: - Creating shadow for "Auth" storyboard UIView
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if shadowLayer == nil {
            self.backgroundColor = UIColor(named: "Background")
            shadowLayer = CAShapeLayer()
            shadowLayer.path = UIBezierPath(roundedRect: bounds,byRoundingCorners:[.topRight, .topLeft], cornerRadii: CGSize(width: 40, height:  40)).cgPath
            shadowLayer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            shadowLayer.fillColor = UIColor(red: 19.0/255.0, green: 27.0/255.0, blue: 34.0/255.0, alpha:1).cgColor
            shadowLayer.shadowColor = UIColor(red: 215.0/255.0, green: 194.0/255.0, blue: 194.0/255.0, alpha: 0.7).cgColor
            shadowLayer.shadowPath = shadowLayer.path
            shadowLayer.shadowOffset = CGSize(width: 1.0, height: 1.0)
            shadowLayer.shadowOpacity = 0.9
            shadowLayer.shadowRadius = 5
            layer.insertSublayer(shadowLayer, at: 0)
        }
    }
}
