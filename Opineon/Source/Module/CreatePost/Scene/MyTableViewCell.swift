//
//  MyTableViewCell.swift
//  Opineon
//
//  Created by Gaurav Kewalramani on 20/01/23.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    static let identifier = "MyTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "MyTableViewCell", bundle: nil)
    }
    
    public func configure (with title: String, imageName: String) {
        myLabel.text  = title
        myImageView.image = UIImage(systemName: imageName)
    }

    @IBOutlet var myLabel: UILabel!
    @IBOutlet var myImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

