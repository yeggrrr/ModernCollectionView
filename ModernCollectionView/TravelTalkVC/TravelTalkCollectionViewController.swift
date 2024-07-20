//
//  TravelTalkCollectionViewController.swift
//  ModernCollectionView
//
//  Created by YJ on 7/20/24.
//

import UIKit
import SnapKit

class TravelTalkCollectionViewController: UIViewController {
    // MARK: UI
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
    
    // MARK: Properties
    
    // MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    // MARK: Functions
    func configure() {
        // view
        view.backgroundColor = .systemBackground
        
        // navigation
        navigationItem.title = "TRAVEL TALK"
        
        // searchController
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "친구 이름을 검색해보세요"
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.tintColor = .label
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationController?.isToolbarHidden = true
        
        // collecionView
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func collectionViewLayout() -> UICollectionViewLayout {
        var configuration = UICollectionLayoutListConfiguration(appearance: .plain)
        configuration.backgroundColor = .white
        configuration.showsSeparators = true
        
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        return layout
    }
    
    
}
