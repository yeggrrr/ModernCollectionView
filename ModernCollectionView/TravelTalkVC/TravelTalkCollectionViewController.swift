//
//  TravelTalkCollectionViewController.swift
//  ModernCollectionView
//
//  Created by YJ on 7/20/24.
//

import UIKit
import SnapKit

struct ChattingRoom: Hashable, Identifiable {
    let id = UUID()
    let profileImage: String
    let userName: String
    let currentChat: String
}

class TravelTalkCollectionViewController: UIViewController {
    // MARK: Enum
    enum Section: CaseIterable {
        case user
    }
    
    // MARK: UI
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
    
    // MARK: Properties
    let chattingList = [
        ChattingRoom(profileImage: "Hue", userName: "Hue", currentChat: "왜요? 요즘 코딩이 대세인데"),
        ChattingRoom(profileImage: "Jack", userName: "Jack", currentChat: "깃허브는 푸시하셨나여?"),
        ChattingRoom(profileImage: "Bran", userName: "Bran", currentChat: "과제 화이팅!"),
        ChattingRoom(profileImage: "Den", userName: "Den", currentChat: "벌써 퇴근하세여?ㅎㅎㅎㅎㅎ"),
        ChattingRoom(profileImage: "내옆자리의앞자리에개발잘하는친구", userName: "내옆자리의앞자리에개발잘하는친구", currentChat: "내일 모닝콜 해주실분~"),
        ChattingRoom(profileImage: "심심이", userName: "심심이", currentChat: "아닛 주말과제라닛")
    ]
    
    var dataSource: UICollectionViewDiffableDataSource<Section, ChattingRoom>!
    
    // MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        configureDataSource()
        updateSnapShot()
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
        configuration.backgroundColor = .systemBackground
        configuration.showsSeparators = true
        
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        return layout
    }
    
    func configureDataSource() {
        var registration: UICollectionView.CellRegistration<UICollectionViewListCell, ChattingRoom>!
        registration = UICollectionView.CellRegistration { cell, indexPath, itemIdentifier in
            var content = UIListContentConfiguration.cell()
            content.text = itemIdentifier.userName
            content.textProperties.font = .systemFont(ofSize: 15, weight: .semibold)
            content.textProperties.color = .label
            
            content.secondaryText = itemIdentifier.currentChat
            content.secondaryTextProperties.font = .systemFont(ofSize: 13, weight: .regular)
            content.secondaryTextProperties.color = .lightGray
            
            content.image = UIImage(named: itemIdentifier.profileImage)
            content.imageProperties.reservedLayoutSize = CGSize(width: 60, height: 60)
            content.imageProperties.maximumSize = CGSize(width: 50, height: 50)
            content.imageProperties.cornerRadius = 25
            content.imageToTextPadding = 10
            
            var bgConfig = UIBackgroundConfiguration.listPlainCell()
            bgConfig.backgroundColor = .systemBackground
            
            cell.contentConfiguration = content
            cell.backgroundConfiguration = bgConfig
        }
        
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: registration, for: indexPath, item: itemIdentifier)
            return cell
        })
    }
    
    func updateSnapShot() {
        var snapShot = NSDiffableDataSourceSnapshot<Section, ChattingRoom>()
        snapShot.appendSections(Section.allCases)
        snapShot.appendItems(chattingList, toSection: Section.user)
        dataSource.apply(snapShot)
    }
}
