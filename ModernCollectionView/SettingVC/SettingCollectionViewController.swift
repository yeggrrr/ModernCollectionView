//
//  SettingCollectionViewController.swift
//  ModernCollectionView
//
//  Created by YJ on 7/19/24.
//

import UIKit
import SnapKit

// MARK: Model
struct Setting: Hashable, Identifiable {
    let id = UUID()
    let title: String
}

class SettingCollectionViewController: UIViewController {
    // MARK: Enum
    enum Section: CaseIterable {
        case entire
        case personal
        case etc
    }
    
    // MARK: UI
    lazy var collecionView = UICollectionView(frame: .zero, collectionViewLayout: collecionviewLayout())
    
    // MARK: Properties
    let entireList: [Setting] = [
        Setting(title: "공지사항"),
        Setting(title: "실험실"),
        Setting(title: "버전 정보")
    ]
    
    let personalList: [Setting] = [
        Setting(title: "개인/보안"),
        Setting(title: "알림"),
        Setting(title: "채팅"),
        Setting(title: "멀티프로필")
    ]
    
    let etcList: [Setting] = [
        Setting(title: "고객센터/도움말")
    ]
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Setting>!
    
    // MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        configureDataSource()
        updateSnapShot()
    }
    
    func configure() {
        // view
        view.backgroundColor = .white
        
        // navigation
        navigationItem.title = "설정"
        
        // addSubviews
        view.addSubview(collecionView)
        
        // layout
        collecionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // MARK: Functions
    func collecionviewLayout() -> UICollectionViewLayout {
        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        configuration.backgroundColor = .systemBackground
        configuration.showsSeparators = true
        
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        return layout
    }
    
    func configureDataSource() {
        var registration: UICollectionView.CellRegistration<UICollectionViewListCell, Setting>!
        registration = UICollectionView.CellRegistration { cell, indexPath, itemIdentifier in
            var content = UIListContentConfiguration.valueCell()
            content.text = itemIdentifier.title
            content.textProperties.font = .systemFont(ofSize: 17, weight: .regular)
            content.textProperties.color = .label
            cell.contentConfiguration = content
            
            var bgConfig = UIBackgroundConfiguration.listPlainCell()
            bgConfig.backgroundColor = .systemBackground
            cell.backgroundConfiguration = bgConfig
        }
        
        dataSource = UICollectionViewDiffableDataSource(collectionView: collecionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: registration, for: indexPath, item: itemIdentifier)
            return cell
        })
    }
    
    func updateSnapShot() {
        var snapShot = NSDiffableDataSourceSnapshot<Section, Setting>()
        snapShot.appendSections(Section.allCases)
        snapShot.appendItems(entireList, toSection: Section.entire)
        snapShot.appendItems(personalList, toSection: Section.personal)
        snapShot.appendItems(etcList, toSection: Section.etc)
        dataSource.apply(snapShot)
    }
}

