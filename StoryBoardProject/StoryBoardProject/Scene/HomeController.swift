//
//  ViewController.swift
//  StoryBoardProject
//
//  Created by Muhammet  on 20.06.2022.
//

import UIKit
import Alamofire
import Kingfisher

protocol MovieOutput {
    func selectedMovies(movieID: Int)
}
class HomeController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
   
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.collectionView.register(CollectionViewCell.nib, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        self.tableView.register(HomeTableViewCell.nib, forCellReuseIdentifier: HomeTableViewCell.identifier)
   
        
        let nib = UINib(nibName: String(describing: HomeTableViewCell.self), bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: String(describing: HomeTableViewCell.self))
        
     
      
        configure()
        
    
        
    }
    private func configure(){
        fetchUpComingMovieDatas()
        fetchNowPlayingMovieDatas()
    }
    private lazy var nowPlayingMovieModelResult = [NowPlayingMovieModelResult]()
    private lazy var upComingMovieModelResult = [UpComingMovieModelResult]()
    private var viewModel: HomeViewModelProtocol = HomeViewModel(service: Services())
    
    private func fetchUpComingMovieDatas() {
        viewModel.fetchUpComingMovies { [weak self] movie in
            guard let movie = movie?.results else { return }
            self?.upComingMovieModelResult = movie
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        } onError: { error in
            print(error)
        }
    }
    
    private func fetchNowPlayingMovieDatas() {
        viewModel.fetchNowPlayingMovies { [weak self] movie in
            guard let movie = movie?.results else { return }
            self?.nowPlayingMovieModelResult = movie
            
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        } onError: { error in
            print(error)
        }

    }
    

}
extension HomeController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nowPlayingMovieModelResult.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      guard let cell:CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as? CollectionViewCell else {
          return UICollectionViewCell()
           
        }
        cell.saveModel(model: nowPlayingMovieModelResult[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.delegate?.selectedMovies(movieID: nowPlayingMovieModelResult[indexPath.row].id ?? 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(
            width: collectionView.frame.size.width,
            height: collectionView.frame.size.height
        )
    }
    
}

//MARK: - Table View Extension
extension HomeController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        upComingMovieModelResult.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: HomeTableViewCell = tableView.dequeueReusableCell(withIdentifier: String(describing: HomeTableViewCell.self)) as? HomeTableViewCell else {
            return UITableViewCell()
    
            
        }
        cell.saveMovieModel(model: upComingMovieModelResult[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.delegate?.selectedMovies(movieID: upComingMovieModelResult[indexPath.row].id ?? 0)
    }
}

extension HomeController: MovieOutput {
    func selectedMovies(movieID: Int) {
        viewModel.getMovieDetail(movieID: movieID) { movie in
            guard let movie = movie else { return }
           
        } onError: { error in
            print(error)
        }

    }
}


/*
extension HomeController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageController.currentPage = Int(pageNumber)
    }
} */


