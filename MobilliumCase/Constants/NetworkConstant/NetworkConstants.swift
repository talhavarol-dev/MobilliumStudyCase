//
//  NetworkConstants.swift
//  MobilliumCase
//
//  Created by Muhammet  on 18.06.2022.
//

import Foundation

//https://api.themoviedb.org/3/movie/550?api_key=e1841562d43cd5dc677daf4b05b72f79

extension Constant {
// MARK: - Network
    class NetworkConstant{
        
        enum MovieServiceEndPoint: String {
            
        case BASE_URL = "https://api.themoviedb.org"
        case API_KEY = "e1841562d43cd5dc677daf4b05b72f79"
        case IMAGE_BASE_URL = "https://image.tmdb.org/t/p/w1280"
            
            static func fetchUpComingMovies() -> String {
                "\(BASE_URL.rawValue)/3/movie/upcoming?api_key=\(API_KEY.rawValue)"
            }
            
            static func fetchNowPlayingMovies() -> String {
                "\(BASE_URL.rawValue)/3/movie/now_playing?api_key=\(API_KEY.rawValue)"
            }
            
            static func fetchMovieDetail(movieID: Int) -> String {
                "\(BASE_URL.rawValue)/3/movie/\(movieID)?api_key=\(API_KEY.rawValue)"
            }
            
        }
    }
}
