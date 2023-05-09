//
//  BorderedRoundView.swift
//  Opineon
//
//  Created by Vansika Jain on 10/01/23.
//

import UIKit

@IBDesignable public class BorderedRoundView: UIView {
        
        @IBInspectable var borderColor: UIColor = UIColor.init(red: 250.0/255.0, green: 153.0/255.0, blue: 23.0/255.0, alpha: 1){
                didSet {
                    layer.borderColor = borderColor.cgColor
                }
            }

            @IBInspectable var borderWidth: CGFloat = 1.0 {
                didSet {
                    layer.borderWidth = borderWidth
                }
            }

        @IBInspectable var cornerRadius: CGFloat = 54.0 {
                didSet {
                    layer.cornerRadius = cornerRadius
                }
            }

        }

