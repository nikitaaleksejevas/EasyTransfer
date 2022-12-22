//
//  HomeViewController.swift
//  EasyTransfer
//
//  Created by Nikita Aleksejevas on 2022-11-24.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet private weak var welcomeLabel: UILabel!
    @IBOutlet private weak var balanceLabel: UILabel!
    @IBOutlet private weak var transferTableView: UITableView!
    @IBOutlet private weak var balanceView: UIView!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet weak var sortPullupButton: UIButton!
    
    var user: User!
    var userManager: UserManager!
    private let date = Date()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, \(user.username)!"
        balanceView.layer.cornerRadius = 30
        dateLabel.text = date.getFormattedDate(format: "MMMM d, yyyy")
        
        transferTableView.delegate = self
        transferTableView.dataSource = self
        transferTableView.register(UINib(nibName: "TransferTableViewCell", bundle: nil), forCellReuseIdentifier: "transferCell")
        sortPullupTapped()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        transferTableView.reloadData()
        balanceLabel.text = String(user.balance).toCurrencyFormat()
        
        user.transferHistory.sort { valueOne , valueTwo in
            valueOne.date > valueTwo.date
        }
    }
    
    //MARK: - Functions
    
    private func sortPullupTapped() {
        
        sortPullupButton.menu = UIMenu(children: [
            UIAction(title: "Sort by name", handler: { UIAction in
                
                self.user.transferHistory.sort { valueOne , valueTwo in
                    valueOne.receiverUsername < valueTwo.receiverUsername
                }
                self.transferTableView.reloadData()
            }),
            UIAction(title: "Sort by date", state: .on, handler: { UIAction in
                
                self.user.transferHistory.sort { valueOne , valueTwo in
                    valueOne.date > valueTwo.date
                }
                self.transferTableView.reloadData()
            } ),
            UIAction(title: "Sort by amount", handler: { UIAction in
                
                self.user.transferHistory.sort { valueOne , valueTwo in
                    valueOne.amount > valueTwo.amount
                }
                self.transferTableView.reloadData()
            }),
        ])
        
        sortPullupButton.showsMenuAsPrimaryAction = true
        sortPullupButton.changesSelectionAsPrimaryAction = true
    }
    
    //MARK: - Actions
    
    @IBAction private func sendMoneyTapped(_ sender: Any) {
        
        let sendMoneyVC = SendMoneyViewController()
        sendMoneyVC.user = user
        sendMoneyVC.userManager = userManager
        present(sendMoneyVC, animated: true)
        
    }
    
    @IBAction private func logoutTapped(_ sender: Any) {
        
        self.dismiss(animated: true)
        self.presentingViewController?.dismiss(animated: true)
    }
}

    //MARK: - Extensions

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        user.transferHistory.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "transferCell", for: indexPath) as! TransferTableViewCell
        
        cell.amountLabel.text = user.transferHistory[indexPath.section].getAmount(for: user)
        cell.receiverLabel.text = user.transferHistory[indexPath.section].getUser(for: user)
        cell.dateLabel.text = user.transferHistory[indexPath.section].date
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        10
    }
    
}
