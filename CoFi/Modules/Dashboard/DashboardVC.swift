//
//  DashboardVC.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 12/12/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit
import Kingfisher

class DashboardVC: UIViewController {
    var presentor: DashboardViewToPresenterProtocol?
    public var delegate: DashboardDelegate!
    
    var friendOweToYou: [String] = ["Michael", "Sarah", "Ken", "Jennifer Laurance"]
    var youOweToYourFriend: [String] = ["Sarah", "Jennifer Laurance", "Ken"]
    
    var upcomingData: [Upcoming] = [
        Upcoming(itemName: "Grocery", price: 97000, date: Date(), reminderTime: "1 week", icon: "cart.fill", iconColor: "ffa200", bgColor: "ffeed1"),
        Upcoming(itemName: "Spotify", price: 97000, date: Date(), reminderTime: "1 week", icon: "spotify", iconColor: "ffa200", bgColor: "c5Ffdf"),
        Upcoming(itemName: "Water", price: 97000, date: Date(), reminderTime: "1 week", icon: "drop.fill", iconColor: "_0078Ff", bgColor: "e3F2Ff"),
        Upcoming(itemName: "Grocery", price: 97000, date: Date(), reminderTime: "1 week", icon: "cart.fill", iconColor: "ffa200", bgColor: "ffeed1"),
    ]
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let container: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 40
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let greetingLabel: UILabel = UILabel()
        .configure { v in
            v.text = "Hello Mike,"
            v.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
            v.textAlignment = .left
            v.textColor = Asset.Color._1F1F1F.color
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let groupSelect: UIButton = UIButton()
        .configure { v in
            v.setTitle("My Co-Living ", for: .normal)
            v.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
            v.setTitleColor(Asset.Color._0078Ff.color, for: .normal)
            v.semanticContentAttribute = .forceRightToLeft
            v.setImage(UIImage(systemName: "chevron.right.circle.fill"), for: .normal)
            v.translatesAutoresizingMaskIntoConstraints = false
            v.addTarget(self, action: #selector(groupSelectTapped), for: .touchUpInside)
        }
    
    let profileButton: UIButton = UIButton(type: .custom)
        .configure { v in
            v.setImage(Asset.Image._1.image, for: .normal)
            v.contentMode = .scaleAspectFill
            v.clipsToBounds = true
            v.widthAnchor.constraint(equalToConstant: 50).isActive = true
            v.heightAnchor.constraint(equalToConstant: 50).isActive = true
            
            v.layer.cornerRadius = 25
            v.layer.masksToBounds = true
            v.translatesAutoresizingMaskIntoConstraints = false
            v.addTarget(self, action: #selector(profileTapped), for: .touchUpInside)
        }
    
    let mainCard: GradientView = GradientView(gradientStartColor:Asset.Color._00D8Ff.color,
                                              gradientEndColor: Asset.Color._0078Ff.color,
                                              startPoint: CGPoint(x: 1.0, y: 1.0),
                                              endPoint: CGPoint(x: 0.1, y: 0.0))
        .configure { v in
            v.layer.cornerRadius = 35
            v.layer.masksToBounds = true
            v.heightAnchor.constraint(equalToConstant: 220).isActive = true
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let lmonthSpending: UILabel = UILabel()
        .configure { v in
            v.text = "December Spending"
            v.font = UIFont.systemFont(ofSize: 12, weight: .regular)
            v.textAlignment = .left
            v.textColor = .white
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let ltotalSpending: UILabel = UILabel()
        .configure { v in
            v.text = "Rp 1.500.000"
            v.font = UIFont.systemFont(ofSize: 25, weight: .bold)
            v.textAlignment = .left
            v.textColor = .white
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let lfriendOweToYou: UILabel = UILabel()
        .configure { v in
            v.text = "Friend owe to you"
            v.font = UIFont.systemFont(ofSize: 12, weight: .regular)
            v.textAlignment = .left
            v.textColor = Asset.Color.ffdf00.color
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let lYouOweToYourFriend: UILabel = UILabel()
        .configure { v in
            v.text = "You owe to your friend"
            v.font = UIFont.systemFont(ofSize: 12, weight: .regular)
            v.textAlignment = .left
            v.textColor = Asset.Color.ffdf00.color
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let friendOweToYouCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(MainCardCell.self, forCellWithReuseIdentifier: "friendOweToYouCell")
        cv.showsHorizontalScrollIndicator = false
        cv.showsVerticalScrollIndicator = false
        cv.backgroundColor = .clear
        return cv
    }()
    
    let youOweToYourFriendCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(MainCardCell.self, forCellWithReuseIdentifier: "youOweToYourFriend")
        cv.showsHorizontalScrollIndicator = false
        cv.showsVerticalScrollIndicator = false
        cv.backgroundColor = .clear
        return cv
    }()
    
    let expansesButton: UIButton = UIButton()
        .configure { v in
            v.setImage(UIImage(systemName: "plus"), for: .normal)
            v.backgroundColor = Asset.Color.e3F2Ff.color
            v.layer.cornerRadius = 13
            v.heightAnchor.constraint(equalToConstant: 50).isActive = true
            v.widthAnchor.constraint(equalToConstant: 50).isActive = true
            v.translatesAutoresizingMaskIntoConstraints = false
            v.addTarget(self, action: #selector(expansesTapped), for: .touchUpInside)
        }
    
    let expansesButtonLabel: UILabel = UILabel()
        .configure { v in
            v.text = "Expense"
            v.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
            v.textAlignment = .center
            v.textColor = Asset.Color._1F1F1F.color
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let billButton: UIButton = UIButton()
        .configure { v in
            v.setImage(UIImage(systemName: "repeat"), for: .normal)
            v.backgroundColor = Asset.Color.e3F2Ff.color
            v.layer.cornerRadius = 13
            v.heightAnchor.constraint(equalToConstant: 50).isActive = true
            v.widthAnchor.constraint(equalToConstant: 50).isActive = true
            v.translatesAutoresizingMaskIntoConstraints = false
            v.addTarget(self, action: #selector(billTapped), for: .touchUpInside)
        }
    
    let billButtonLabel: UILabel = UILabel()
        .configure { v in
            v.text = "Bill"
            v.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
            v.textAlignment = .center
            v.textColor = Asset.Color._1F1F1F.color
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let debtButton: UIButton = UIButton()
        .configure { v in
            //            v.setImage(UIImage(systemName: "repeat"), for: .normal)
            v.setTitle("$", for: .normal)
            v.setTitleColor(Asset.Color._0078Ff.color, for: .normal)
            v.backgroundColor = Asset.Color.e3F2Ff.color
            v.layer.cornerRadius = 13
            v.heightAnchor.constraint(equalToConstant: 50).isActive = true
            v.widthAnchor.constraint(equalToConstant: 50).isActive = true
            v.translatesAutoresizingMaskIntoConstraints = false
            v.addTarget(self, action: #selector(debtTapped), for: .touchUpInside)
        }
    
    let debtButtonLabel: UILabel = UILabel()
        .configure { v in
            v.text = "Debt"
            v.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
            v.textAlignment = .center
            v.textColor = Asset.Color._1F1F1F.color
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let upcomingTableView: UITableView = UITableView()
        .configure { v in
            v.translatesAutoresizingMaskIntoConstraints = false
            v.separatorStyle = .none
            v.register(UpcomingCell.self, forCellReuseIdentifier: "upcomingCell")
        }
    
    let lUpcoming: UILabel = UILabel()
        .configure { v in
            v.text = "Upcoming Bills"
            v.font = UIFont.systemFont(ofSize: 16, weight: .bold)
            v.textAlignment = .left
            v.textColor = Asset.Color._1F1F1F.color
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let upcomingSeeAllButton: UIButton = UIButton()
        .configure { v in
            v.setTitle("See All", for: .normal)
            v.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .regular)
            v.setTitleColor(Asset.Color._0078Ff.color, for: .normal)
            v.translatesAutoresizingMaskIntoConstraints = false
            v.addTarget(self, action: #selector(UpcomingSeeAllButtonTapped), for: .touchUpInside)
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        getData()
        
        friendOweToYouCollection.delegate = self
        friendOweToYouCollection.dataSource = self
        
        youOweToYourFriendCollection.delegate = self
        youOweToYourFriendCollection.dataSource = self
        
        upcomingTableView.delegate = self
        upcomingTableView.dataSource = self
        
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hideNavigationBar(animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        showNavigationBar(animated: animated)
    }
    
    func getData() {
        let user = CoreHelper.getUser()
        if user.profileImageUrl != "" {
            let url = URL(string: user.profileImageUrl)
            self.profileButton.kf
                .setImage(with: url,
                          for: .normal)
        }
        self.greetingLabel.text = "Hello \(user.first)"
    }
    
    @objc func profileTapped() {
        print("Hello World")
    }
    
    @objc func groupSelectTapped() {
        print("Hello World")
    }
    
    @objc func expansesTapped() {
        presentor?.goToCreateExpense(from: self)
    }
    
    @objc func billTapped() {
        presentor?.goToCreateBill(from: self)
    }
    
    @objc func debtTapped() {
        presentor?.goToCreateDebt(from: self)
    }
    
    @objc func UpcomingSeeAllButtonTapped() {
        print("Hello World")
    }
}

extension DashboardVC: DashboardPresenterToViewProtocol {
    
}

extension DashboardVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case friendOweToYouCollection:
            
            if friendOweToYou[indexPath.item].size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17)]).width + 20 < 80 {
                
                return CGSize(width: 88, height: 34)
                
            } else {
                
                return CGSize(width: friendOweToYou[indexPath.item].size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17)]).width + 20, height: 34)
                
            }
        case youOweToYourFriendCollection:
            
            if youOweToYourFriend[indexPath.item].size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17)]).width + 20 < 80 {
                
                return CGSize(width: 88, height: 34)
                
            } else {
                
                return CGSize(width: youOweToYourFriend[indexPath.item].size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17)]).width + 20, height: 34)
                
            }
        default:
            return CGSize(width: 88, height: 34)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case friendOweToYouCollection:
            return friendOweToYou.count
        case youOweToYourFriendCollection:
            return youOweToYourFriend.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case friendOweToYouCollection:
            let cell = friendOweToYouCollection.dequeueReusableCell(withReuseIdentifier: "friendOweToYouCell", for: indexPath) as! MainCardCell
            cell.lUser.text = friendOweToYou[indexPath.row]
            return cell
        case youOweToYourFriendCollection:
            let cell = youOweToYourFriendCollection.dequeueReusableCell(withReuseIdentifier: "youOweToYourFriend", for: indexPath) as! MainCardCell
            cell.lUser.text = youOweToYourFriend[indexPath.row]
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == friendOweToYouCollection {
            presentor?.goToUserDebtDetails(from: self)
        }
    }
    
    func chooseColor(color: String) -> UIColor {
        switch color {
        case "_00D8Ff":
            return Asset.Color._00D8Ff.color
        case "_0078Ff":
            return Asset.Color._0078Ff.color
        case "a9A9A9":
            return Asset.Color.a9A9A9.color
        case "ffa200":
            return Asset.Color.ffa200.color
        case "ffeed1":
            return Asset.Color.ffeed1.color
        case "_1F1F1F":
            return Asset.Color._1F1F1F.color
        case "e3F2Ff":
            return Asset.Color.e3F2Ff.color
        case "ffdf00":
            return Asset.Color.ffdf00.color
        case "c5Ffdf":
            return Asset.Color.c5Ffdf.color
        default:
            return Asset.Color.ffdf00.color
        }
    }
    
}

extension DashboardVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if upcomingData.count > 3 {
            return 3
        } else {
            return upcomingData.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = upcomingTableView.dequeueReusableCell(withIdentifier: "upcomingCell", for: indexPath) as! UpcomingCell
        let data = upcomingData[indexPath.row]
        cell.lItem.text = data.itemName
        cell.icon.image = UIImage(systemName: data.icon)
        if cell.icon.image == nil {
            cell.icon.image = UIImage(named: data.icon)
        }
        cell.icon.tintColor = chooseColor(color: data.iconColor)
        cell.bg.backgroundColor = chooseColor(color: data.bgColor)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 58
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


// Views
extension DashboardVC {
    func setupViews() {
        setupScrollView()
        
        let v1 = UIView().configure { v in
            v.translatesAutoresizingMaskIntoConstraints = false
            v.heightAnchor.constraint(equalToConstant: 60).isActive = true
            
            v.addSubview(greetingLabel)
            greetingLabel.topAnchor.constraint(equalTo: v.topAnchor).isActive = true
            
            v.addSubview(groupSelect)
            groupSelect.topAnchor.constraint(equalTo: greetingLabel.bottomAnchor, constant: 0).isActive = true
            
            v.addSubview(profileButton)
            profileButton.centerYAnchor.constraint(equalTo: v.centerYAnchor).isActive = true
            profileButton.trailingAnchor.constraint(equalTo: v.trailingAnchor).isActive = true
        }
        
        let gradient = CAGradientLayer()
        gradient.frame = self.mainCard.frame
        gradient.colors = [UIColor.red.cgColor, UIColor.yellow.cgColor]
        mainCard.layer.addSublayer(gradient)
        
        mainCard.addSubview(lmonthSpending)
        lmonthSpending.topAnchor.constraint(equalTo: mainCard.topAnchor, constant: 20).isActive = true
        lmonthSpending.leadingAnchor.constraint(equalTo: mainCard.leadingAnchor, constant: 20).isActive = true
        
        mainCard.addSubview(ltotalSpending)
        ltotalSpending.topAnchor.constraint(equalTo: lmonthSpending.bottomAnchor, constant: 0).isActive = true
        ltotalSpending.leadingAnchor.constraint(equalTo: mainCard.leadingAnchor, constant: 20).isActive = true
        
        mainCard.addSubview(lfriendOweToYou)
        lfriendOweToYou.topAnchor.constraint(equalTo: ltotalSpending.bottomAnchor, constant: 10).isActive = true
        lfriendOweToYou.leadingAnchor.constraint(equalTo: mainCard.leadingAnchor, constant: 20).isActive = true
        
        mainCard.addSubview(friendOweToYouCollection)
        friendOweToYouCollection.topAnchor.constraint(equalTo: lfriendOweToYou.bottomAnchor, constant: 5).isActive = true
        friendOweToYouCollection.leadingAnchor.constraint(equalTo: mainCard.leadingAnchor, constant: 0).isActive = true
        friendOweToYouCollection.trailingAnchor.constraint(equalTo: mainCard.trailingAnchor).isActive = true
        friendOweToYouCollection.heightAnchor.constraint(equalToConstant: 34).isActive = true
        
        mainCard.addSubview(lYouOweToYourFriend)
        lYouOweToYourFriend.topAnchor.constraint(equalTo: friendOweToYouCollection.bottomAnchor, constant: 15).isActive = true
        lYouOweToYourFriend.leadingAnchor.constraint(equalTo: mainCard.leadingAnchor, constant: 20).isActive = true
        
        mainCard.addSubview(youOweToYourFriendCollection)
        youOweToYourFriendCollection.topAnchor.constraint(equalTo: lYouOweToYourFriend.bottomAnchor, constant: 5).isActive = true
        youOweToYourFriendCollection.leadingAnchor.constraint(equalTo: mainCard.leadingAnchor, constant: 0).isActive = true
        youOweToYourFriendCollection.trailingAnchor.constraint(equalTo: mainCard.trailingAnchor).isActive = true
        youOweToYourFriendCollection.heightAnchor.constraint(equalToConstant: 34).isActive = true
        
        let v3: UIView = UIView().configure { v in
            v.heightAnchor.constraint(equalToConstant: 70).isActive = true
            v.translatesAutoresizingMaskIntoConstraints = false
            
            v.addSubview(billButton)
            billButton.topAnchor.constraint(equalTo: v.topAnchor, constant: 10).isActive = true
            billButton.centerXAnchor.constraint(equalTo: v.centerXAnchor).isActive = true
            v.addSubview(billButtonLabel)
            billButtonLabel.topAnchor.constraint(equalTo: billButton.bottomAnchor, constant: 5).isActive = true
            billButtonLabel.centerXAnchor.constraint(equalTo: billButton.centerXAnchor).isActive = true
            
            v.addSubview(expansesButton)
            expansesButton.topAnchor.constraint(equalTo: v.topAnchor, constant: 10).isActive = true
            expansesButton.trailingAnchor.constraint(equalTo: billButton.leadingAnchor, constant: -25).isActive = true
            v.addSubview(expansesButtonLabel)
            expansesButtonLabel.topAnchor.constraint(equalTo: expansesButton.bottomAnchor, constant: 5).isActive = true
            expansesButtonLabel.centerXAnchor.constraint(equalTo: expansesButton.centerXAnchor).isActive = true
            
            v.addSubview(debtButton)
            debtButton.topAnchor.constraint(equalTo: v.topAnchor, constant: 10).isActive = true
            debtButton.leadingAnchor.constraint(equalTo: billButton.trailingAnchor, constant: 25).isActive = true
            v.addSubview(debtButtonLabel)
            debtButtonLabel.topAnchor.constraint(equalTo: debtButton.bottomAnchor, constant: 5).isActive = true
            debtButtonLabel.centerXAnchor.constraint(equalTo: debtButton.centerXAnchor).isActive = true
        }
        
        
        
        let v4: UIView = UIView().configure { v in
            v.heightAnchor.constraint(equalToConstant: 200).isActive = true
            v.translatesAutoresizingMaskIntoConstraints = false
            
            v.addSubview(lUpcoming)
            lUpcoming.topAnchor.constraint(equalTo: v.topAnchor, constant: 20).isActive = true
            lUpcoming.leadingAnchor.constraint(equalTo: v.leadingAnchor).isActive = true
            
            v.addSubview(upcomingSeeAllButton)
            upcomingSeeAllButton.topAnchor.constraint(equalTo: v.topAnchor, constant: 20).isActive = true
            upcomingSeeAllButton.trailingAnchor.constraint(equalTo: v.trailingAnchor).isActive = true
            
            v.addSubview(upcomingTableView)
            upcomingTableView.topAnchor.constraint(equalTo: lUpcoming.bottomAnchor, constant: 10).isActive = true
            upcomingTableView.trailingAnchor.constraint(equalTo: v.trailingAnchor).isActive = true
            upcomingTableView.heightAnchor.constraint(equalToConstant: 200).isActive = true
            upcomingTableView.leadingAnchor.constraint(equalTo: v.leadingAnchor).isActive = true
        }
        
        container.addArrangedSubview(v1)
        container.addArrangedSubview(mainCard)
        container.addArrangedSubview(v3)
        container.addArrangedSubview(v4)
        
    }
    
    func setupScrollView() {
        
        self.view.addSubview(scrollView)
        scrollView.addSubview(container)
        
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        container.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 50).isActive = true
        container.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        // Important!
        container.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        container.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.90).isActive = true
        container.spacing = 20
    }
}

