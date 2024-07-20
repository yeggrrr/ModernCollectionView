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
    }
}
