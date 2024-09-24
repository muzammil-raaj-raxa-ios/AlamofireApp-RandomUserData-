//
//  RandomUserDataVC.swift
//  AlamofireApp
//
//  Created by Mag isb-10 on 24/09/2024.
//

import UIKit
import Alamofire
import SDWebImage

struct ResponseData: Decodable {
  let results: [RandomUserModel]
}

class RandomUserDataVC: UIViewController {

  @IBOutlet weak var userTblView: UITableView!
  
  var users = [RandomUserModel]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
  
    userTblView.dataSource = self
    userTblView.delegate = self
    userTblView.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: "UserCell")
    getUserData()
  }
  
  func getUserData() {
    let url = "https://randomuser.me/api/?results=100"
    AF.request(url).responseDecodable(of: ResponseData.self) { response in
      switch response.result {
      case .success(let data):
        self.users = data.results
        self.userTblView.reloadData()
      case .failure(let error):
        print("Error \(error.localizedDescription)")
      }
    }
    
  }

}

extension RandomUserDataVC: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return users.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as? UserCell else { return UITableViewCell() }
    
    let item = users[indexPath.row]
    cell.nameLbl.text = "\(item.name.first) \(item.name.last)"
    cell.emailLbl.text = item.email
    cell.nationalityLbl.text = item.nat
    if let thumbnailURL = URL(string: item.picture.thumbnail) {
      cell.profileImg.sd_setImage(with: thumbnailURL)
    }
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 110
  }
}
