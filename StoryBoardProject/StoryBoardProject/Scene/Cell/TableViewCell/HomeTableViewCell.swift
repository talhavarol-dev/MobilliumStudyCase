//
//  HomeTableViewCell.swift
//  StoryBoardProject
//
//  Created by Muhammet  on 20.06.2022.
//

import UIKit
import Kingfisher
class HomeTableViewCell: UITableViewCell {

    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil) }
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieOverviewLabel: UILabel!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func saveMovieModel(model: UpComingMovieModelResult) {
        // Release Date
        releaseDateLabel.text = model.releaseDate
        // Overview
        movieOverviewLabel.text = model.overview
        // Movie Name
        movieNameLabel.text = model.title
        // Movie Image
        movieImage.kf.setImage(with: URL(string: Constant.NetworkConstant.MovieServiceEndPoint.IMAGE_BASE_URL.rawValue + (model.posterPath ?? "")))
    }
    
}
