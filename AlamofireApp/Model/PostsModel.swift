//
//  PostsModel.swift
//  AlamofireApp
//
//  Created by Mag isb-10 on 26/03/2024.
//

import Foundation

struct PostsModel: Decodable {
    let userID, id: Int
    let title, body: String
  
  enum CodingKeys: String, CodingKey {
    case userID = "userId"
    case id = "id"
    case title = "title"
    case body = "body"
  }
}
