//
//  MainViewController.swift
//  Bangpa
//
//  Created by 이동건 on 31/07/2018.
//  Copyright © 2018 이동건. All rights reserved.
//

import UIKit

enum MainVCSection: Int {
    case advertisement = 0
    case newStudy
    
    var description: String {
        switch self {
        case .advertisement:
            return "기획전"
        case .newStudy:
            return "새로운 스터디"
        }
    }
    
    static var count: Int {
        return 2
    }
}

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private lazy var showMapButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Show map", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(handleShowMapViewController), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupNavigationController()
    }
    
    fileprivate func setupNavigationController(){
        self.navigationItem.titleView = showMapButton
        self.navigationController?.navigationBar.setGradientBackground(colors: [UIColor.gradientStartBlue, UIColor.gradientEndBlue])
    }
    
    fileprivate func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: SectionDescriptionTableViewCell.reusableIdentifier, bundle: nil), forCellReuseIdentifier: SectionDescriptionTableViewCell.reusableIdentifier)
    }
    
    @objc func handleShowMapViewController(_ sender: UIButton) {
        let mapViewController = MapViewController.initFromStoryboard()
        self.present(mapViewController, animated: true, completion: nil)
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension MainViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return MainVCSection.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = MainVCSection(rawValue: section) else { return 0 }
        return section == .advertisement ? (1 + 1) : (1 + 3) // 1 for Section Discription Cell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = MainVCSection(rawValue: indexPath.section) else { return UITableViewCell() }
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SectionDescriptionTableViewCell.reusableIdentifier, for: indexPath) as? SectionDescriptionTableViewCell else {
                return UITableViewCell()
            }
            
            cell.descriptionLabel.text = section.description

            if section == .newStudy {
                cell.showAllButton.isHidden = false
            }
            
            return cell
        }
        
        switch section {
        case .advertisement:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MainPromotionTableViewCell.reusableIdentifier, for: indexPath) as? MainPromotionTableViewCell else {
                return UITableViewCell()
            }
            
            return cell
        case .newStudy:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: StudyGroupTableViewCell.reusableIdentifier, for: indexPath) as? StudyGroupTableViewCell else { return UITableViewCell()}
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let section = MainVCSection(rawValue: indexPath.section) else { return 0 }
        
        if indexPath.row == 0 {
            return 60
        }
        
        return section == .advertisement ? tableView.frame.height / 2.3 : 110
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 10))
        footer.backgroundColor = UIColor.footerColor
        return footer
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        guard let section = MainVCSection(rawValue: section) else { return 0 }
        return section == .advertisement ? 15 : 0
    }
}
