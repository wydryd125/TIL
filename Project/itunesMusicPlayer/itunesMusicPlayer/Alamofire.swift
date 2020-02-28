//
//  Alamofire.swift
//  itunesMusicPlayer
//
//  Created by 정유경 on 2020/02/28.
//  Copyright © 2020 정유경. All rights reserved.
//

import Alamofire

final class API {
    
    private var songRequest: DataRequest? = nil {
        didSet { oldValue?.cancel() }
    }
    func fetchSongs(term: String, completion: @escaping (Result<Songs, Error>) -> Void) {
        let urlString = SearchURL()
            .addQuery(key: .term, value: term)
            .addQuery(key: .country, value: "US")
            .addQuery(key: .media, value: "music")
            .addQuery(key: .entity, value: "song")
//            .addQuery(key: .lang, value: "en_US")
            .resolvedURL()
        
        songRequest = AF.request(urlString)
        songRequest?
        .validate()
            .responseDecodable { (response: DataResponse<Songs, AFError>) in
                switch response.result {
                case .success(let songs):
                    completion(.success(songs))
                case .failure(let error):
                    completion(.failure(error))
                }
                
        }

    }
    func fetchArtwork(url: String,
                      completion: @escaping (Result<Data, Error>) -> Void
    ) -> URLSessionTask? {
        let request = AF.request(url)
        
        request
            .validate(contentType: ["image/jpeg"])
            .responseData {
                guard let data = try? $0.result.get() else { return }
                completion(.success(data))
        }
        return request.task
    }
}

extension API {
    final class SearchURL {
        
        enum Key: String {
            case term, country, media, entity, lang
        }
        
        private let baseURL: String = "https://itunes.apple.com/search?"
        private var query: String = ""
        
        func addQuery(key: Key, value: String) -> Self {
            query += "\(key.rawValue)=\(value)&"
            return self
        }
        
        func resolvedURL() -> String {
            let url = baseURL + query
            query = ""
            return String(url.dropLast())
        }
    }
}
