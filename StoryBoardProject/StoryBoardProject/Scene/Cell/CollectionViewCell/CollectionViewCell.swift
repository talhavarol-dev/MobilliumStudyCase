//
//  CollectionViewCell.swift
//  StoryBoardProject
//
//  Created by Muhammet  on 20.06.2022.
//

import UIKit
import Kingfisher
class CollectionViewCell: UICollectionViewCell {

    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil) }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieOverviewLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
     
        // Initialization code
    }

    func saveModel(model: NowPlayingMovieModelResult) {
        movieNameLabel.text = model.title
        movieOverviewLabel.text = model.overview
        imageView.kf.setImage(with: URL(string: Constant.NetworkConstant.MovieServiceEndPoint.IMAGE_BASE_URL.rawValue + (model.posterPath ?? "")))
    }
}
