//
//  Constants.swift
//  DemoApp
//
//  Created by Jagdeep Singh on 14/03/18.
//  Copyright © 2018 Jk. All rights reserved.
//

import Foundation

//webservices
let baseUrl = "https://jsonplaceholder.typicode.com"

let kUsers = baseUrl + "/users"
let kAlbums = baseUrl + "/albums?userId=" + UserId
let kPosts = baseUrl + "/posts?userId=" + UserId
let kToDo = baseUrl + "/todos?userId=" + UserId
let kPhotos = baseUrl + "/photos?albumId=" 

//Storyboard ids

let kPostsDetailsId = "PostDetailControl"
let kGallaryId = "GallaryControl"
