//
//  HomeViewController.swift
//  Opineon
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - IB Outlet
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Other Properties
    
    var viewModel = HomeViewModel()
    var userNameArray = [Users]()
    var surveyArray = [Surveys]()
    var addModel = UserAddViewModel()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //additional setup after loading the view.
        configureUI()
    }
}

extension HomeViewController {
    
    // MARK: - Configure UI
    
    func configureUI() {
        getUserDetails()
        getSurveyDetails()
    }
    
    // MARK: - Getting the user information
    
    func getUserDetails() {
        self.viewModel.getUserData { (userList, error) in
            if let list = userList {
                self.userNameArray = list
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Getting the survey details
    
    func getSurveyDetails() {
        self.viewModel.getSurveyData{(surveyList,error) in
            if let surveysList = surveyList{
                self.surveyArray = surveysList
            }
        }
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

    // MARK: - Data Source and Delegate

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.surveyArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeScreenTableViewCell",
                                                 for: indexPath) as! HomeScreenTableViewCell
        let userName = self.userNameArray[indexPath.row].name
        cell.userName?.text = userName
        cell.descriptionOfPost?.text = self.surveyArray[0].description
        return cell
    }
}
