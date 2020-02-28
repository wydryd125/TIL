//
//  ViewController.swift
//  itunesMusicPlayer
//
//  Created by 정유경 on 2020/02/28.
//  Copyright © 2020 정유경. All rights reserved.
//

import UIKit
import AVKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    
    private let searchController = UISearchController(searchResultsController: nil)
    private let scopeButtonTitle = ["Search","Swift","IU","Twice"]
    
    private let api = API()
    private var songs: [Songs.Song] = []
    private var artworkRequest: [Int: URLSessionTask] = [:]
    private let player = AVPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tableView.tableHeaderView = searchController.searchBar
        
        navigationItem.searchController = searchController
        
        //iOS 13미만
        //서치부분만 하얗게 강조되고 나머지 배경은 어둡게... 13이상은 자동으로 설정되어있음.
        //
        definesPresentationContext = true
        //서치바 부분의 버튼 색상 바꿀수 있음.
        searchController.searchBar.tintColor = .red
        // 서치부분 제외한 배경이 어두워지는 것을 막음. 기본값은 true(딤 처리?)
        searchController.obscuresBackgroundDuringPresentation = false
        // 서치부분의 cancel 버튼 안보이게
        searchController.searchBar.showsCancelButton = false
        searchController.searchBar.placeholder = "Search Songs"
        searchController.searchBar.delegate = self
        // 서치부분을 눌렀을때 슬라이드 형식의 버튼생성. ["Search","Swift","IU","Twice"]
        searchController.searchBar.scopeButtonTitles = scopeButtonTitle
      
    }


}
extension ViewController: UISearchBarDelegate {
    func fetchSongs(term: String) {
        indicatorView.stopAnimating()
        
        api.fetchSongs(term: term) { [weak self] result in
            switch result {
            case .success(let value):
                self?.songs = value.results
                self?.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
            self?.indicatorView.stopAnimating()
        }
    }
    
    // 서치부분에 입력하고 엔터누르면 나오는..
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(searchBar.text ?? "")
     
        guard let text = searchBar.text,
            var term = text.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
            else { return }
        term = term.trimmingCharacters(in: .whitespacesAndNewlines)
        fetchSongs(term: term)
    }
    // 스코프 버튼 눌렀을때 일어나는..
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        print(selectedScope)
        if selectedScope != 0 {
            let term = scopeButtonTitle[selectedScope]
            fetchSongs(term: term)
        }
    }
}
extension ViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let song = songs[indexPath.row]
        cell.textLabel?.text = song.trackName
        cell.detailTextLabel?.text = song.artistName
        
        let task = api.fetchArtwork(url: song.artworkUrl100) { result in
            cell.imageView?.image = UIImage(data: try! result.get())
            self.artworkRequest[indexPath.row] = nil
        }
        artworkRequest[indexPath.row] = task
        
        return cell
    }
}
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        artworkRequest[indexPath.row]?.cancel()
        artworkRequest[indexPath.row] = nil
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let song = songs[indexPath.row]
        guard let url = URL(string: song.previewUrl) else { return }
        player.pause()
        
        let item = AVPlayerItem(url: url)
        player.replaceCurrentItem(with: item)
        player.play()
        
    }
  
    
}
