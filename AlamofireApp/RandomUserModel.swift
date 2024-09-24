//
//  RandomUserModel.swift
//  AlamofireApp
//
//  Created by Mag isb-10 on 24/09/2024.
//

import Foundation

struct RandomUserModel: Decodable {
  let name: Name
  let email: String
  let nat: String
  let picture: PhotoPic
}

struct Name: Decodable {
  let first: String
  let last: String
}

struct PhotoPic: Decodable {
  let thumbnail: String
}
