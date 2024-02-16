//
//  FeedTableViewCell.swift
//  UMC-Kitten-iOS
//
//  Created by Jongkwon on 2/10/24.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    @IBOutlet weak var calenderImage: UIImageView!
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var diseaseLabel: UILabel!
    @IBOutlet weak var diseaseNameLabel: UILabel!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
