//
//  ViewController.swift
//  AlamofireApp
//
//  Created by Mag isb-10 on 19/03/2024.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

  @IBOutlet weak var postsTblView: UITableView!
  @IBOutlet weak var spinner: UIActivityIndicatorView!
  
  
  @IBOutlet weak var jobTF: UITextField!
  @IBOutlet weak var nameTF: UITextField!
  
  var postsData = [PostsModel]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    postsTblView.delegate = self
    postsTblView.dataSource = self
    postsTblView.register(UINib(nibName: "PostCell", bundle: .main), forCellReuseIdentifier: "PostCell")
    
    getPostsData { apiPostData in
      self.postsData = apiPostData
      
      DispatchQueue.main.async {
        self.postsTblView.reloadData()
      }
    }
    
    spinner.isHidden = true
    spinner.startAnimating()
  }

  func getPostsData(handler: @escaping (_ apiPostData:[PostsModel])->(Void)) {
    let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
    
    AF.request(url!, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil)
      .response { (response) in
        switch response.result {
        case .success(let data):
          do {
            let postData = try JSONDecoder().decode([PostsModel].self, from: data!)
            
            handler(postData)
          } catch {
            print(error.localizedDescription)
          }
        case .failure(let error):
          print(error.localizedDescription)
        }
    }
  }
  
  func postData() {
    let parameters: Parameters = [
      "name": "\(nameTF.text!)",
      "job": "\(jobTF.text!)"
    ]
    
    let url = "https://reqres.in/api/users"
    
    AF.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil, interceptor: nil)
      .responseData { response in
        debugPrint(response)
      }
  }
  
  
  @IBAction func postBtn(_ sender: UIButton!) {
    spinner.isHidden = false
    DispatchQueue.main.asyncAfter(deadline: .now()+1) {
      self.spinner.startAnimating()
      
      DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        self.spinner.isHidden = true
        self.spinner.stopAnimating()
        
        self.postData()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "RandomUserDataVC") as? RandomUserDataVC {
          self.navigationController?.pushViewController(vc, animated: true)
        }
            
      }
    }
  }
  
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return postsData.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as? PostCell 
    else { return UITableViewCell()}

    cell.userIDlbl.text = "UserID: \(postsData[indexPath.row].userID)"
    cell.idLbl.text = "id: \(postsData[indexPath.row].id)"
    cell.titleLbl.text = "Title: \(postsData[indexPath.row].title)"
    cell.bodyLbl.text = "Body: \(postsData[indexPath.row].body)"
    return cell
  }
  
  
}
