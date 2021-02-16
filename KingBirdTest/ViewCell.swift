//
//  ViewCell.swift
//  KingBirdTest
//
//  Created by User on 15.02.2021.
//
import UIKit
import SDWebImage
class ViewCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!

    func setupCell(urlStrng: String){
        image.sd_setImage(with: URL(string: urlStrng),
                          placeholderImage: UIImage(named: "noimage"),
                          options: [],
                          context: nil )
}
    
    override func prepareForReuse() {
        self.image.image = nil
        super.prepareForReuse()
    }
}
