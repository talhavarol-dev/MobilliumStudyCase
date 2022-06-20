//
//  DetailViewController.swift
//  StoryBoardProject
//
//  Created by Muhammet  on 20.06.2022.
//
/*
import UIKit
import Alamofire
import Kingfisher
class DetailViewController: UIViewController {
    
    private var detailResults: DetailViewController

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    init(detailResults: DetailViewController) {
        self.detailResults = detailResults
        
        super.init(nibName: nil, bundle: nil)
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        

        fetchDatas()
    }
    private func fetchDatas() {
        let urlImage = URL(string: Constant.NetworkConstant.MovieServiceEndPoint.IMAGE_BASE_URL.rawValue + (detailResults.posterPath ?? ""))
        imageView.kf.setImage(with: urlImage)
        /*
        guard let vote = detailResults.voteAverage else { return }
        imdbVoteLabel.text = "\(vote)/10"
        
        guard let date = detailResults.releaseDate else { return }
        releaseDateLabel.text = "\(date)"
        
        guard let name = detailResults.title else { return }
        movieNameLabel.text = name
        
        guard let overview = detailResults.overview else { return }
        movieOverviewLabel.text = overview */
    

    /*
     
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

        
}
}
 */
