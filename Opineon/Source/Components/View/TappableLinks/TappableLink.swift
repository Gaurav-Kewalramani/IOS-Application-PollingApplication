//
//  TappableLink.swift
//  Opineon
//
//  Created by Aniket Kumar on 06/12/22.
//

import UIKit

// MARK: - Creating "Terms & Conditions" links

extension NSAttributedString {
    static func makeHyperlink(for path1: String, for path2: String, in string: String, as substring1: String, as substring2: String) -> NSAttributedString {
        let nsString = NSString(string: string)
        let substringRange1 = nsString.range(of: substring1)
        let substringRange2 = nsString.range(of: substring2)
        let attributedString = NSMutableAttributedString(string: string)
        attributedString.addAttribute(.link, value: path1, range: substringRange1)
        attributedString.addAttribute(.link, value: path2, range: substringRange2)
        return attributedString
    }
}

