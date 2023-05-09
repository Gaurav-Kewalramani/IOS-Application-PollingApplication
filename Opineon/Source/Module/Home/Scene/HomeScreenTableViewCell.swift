//
//  HomeScreenTableViewCell.swift
//  Opineon
//
//  Created by Aniket Kumar on 04/01/23.
//

import UIKit

class HomeScreenTableViewCell: UITableViewCell {
    
    // MARK: - IB Outlet
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var sharedCount: UILabel!
    @IBOutlet weak var commentCount: UILabel!
    @IBOutlet weak var likeCount: UILabel!
    @IBOutlet weak var voteCount: UILabel!
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var descriptionOfPost: UILabel!
    
    // MARK: - Life Cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
