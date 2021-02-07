//
//  HomeViewController.swift
//  SurveySystem
//
//  Created by Eyad Shokry on 2/4/21.
//  Copyright © 2021 Eyad Shokry. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var homeTableView: UITableView!
    var surveysArray: [String] = ["يوم 05-01-2021 الساعة 5:00 م", "يوم 05-01-2021 الساعة 11:00 ص", "يوم 05-01-2021 الساعة 5:00 م", "يوم 05-01-2021 الساعة 5:00 م", "يوم 05-01-2021 الساعة 11:00 ص"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        homeTableView.dataSource = self
        homeTableView.delegate = self
        homeTableView.register(UINib(nibName: "HomeTableViewHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "HomeTableViewHeader")
        homeTableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: HomeTableViewCell.identifier)
        homeTableView.separatorStyle = .none
        
    }
    
    
}


extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        surveysArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier) as! HomeTableViewCell
        cell.setupCell(string: surveysArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 94
    }
        
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HomeTableViewHeader") as! HomeTableViewHeader
        headerView.delegate = self
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 590
    }
    
}


extension HomeViewController: HomeHeaderViewDelegate {
    func didAddNewSurveyPressed() {
        let onboardingVC = self.storyboard?.instantiateViewController(identifier: "Onboarding")
        self.navigationController?.pushViewController(onboardingVC!, animated: true)
    }
}
