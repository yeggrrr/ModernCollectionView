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
    enum Section {
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
    
    // MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    func configure() {
        // view
        view.backgroundColor = .white
        
        // addSubviews
        view.addSubview(collecionView)
        
        // layout
        collecionView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    // MARK: Functions
    func collecionviewLayout() -> UICollectionViewLayout {
        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        configuration.backgroundColor = .systemGray
        configuration.showsSeparators = true
        
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        return layout
    }
    
    // MARK: Actions
}

