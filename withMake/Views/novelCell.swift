//
//  novelCell.swift
//  withMake
//
//  Created by 이동건 on 2021/03/24.
//

import UIKit

class novelCell: UITableViewCell {

class novelCell: UITableViewCell {
     
    @IBOutlet var postImageView: UIImageView!
    @IBOutlet var postTitleLabel: UILabel!
    @IBOutlet var postSummaryLabel: UILabel!
    @IBOutlet var numberOfViewLabel: UILabel!
    @IBOutlet var numberOfCommentLabel: UILabel!
    @IBOutlet var tagLabel: UILabel!
    
    var novelmodel: [novelModel] = []
    
    static let identifier = "novelCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "novelCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(with model: novelModel) {
        self.postImageView.image = UIImage(named: model.postImageName)
        self.postTitleLabel.text = model.postTitle
        self.postSummaryLabel.text = model.postSummary
        self.numberOfViewLabel.text = String(format: "%.1f",
                                             model.numberOfView)
        self.numberOfCommentLabel.text = String(format: "%.1f",
                                                model.numberOfComment)
        self.tagLabel.text = model.tag
    }
    
}
