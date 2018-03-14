//
//  ViewController.swift
//  DemoApp
//
//  Created by Jagdeep Singh on 13/03/18.
//  Copyright © 2018 Jk. All rights reserved.
//

var UserId = String() //here i m not using user default because this is demo app

import UIKit

class ViewController: AbstractControl, UsersListProtocol {
    
    //MARK: Identifiers
    @IBOutlet weak var usersListView  : UIView!
    @IBOutlet weak var postsListView  : UIView!
    @IBOutlet weak var albumsListView : UIView!
    @IBOutlet weak var todoListView   : UIView!
    @IBOutlet weak var msgLbl         : UILabel!
   
    @IBOutlet weak var postsHeight: NSLayoutConstraint!
    @IBOutlet weak var todoHeight : NSLayoutConstraint!
    
    var albumsList: AlbumsList!
    var postsList : PostsList!
    var todoList  : ToDoList!
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        self.addChildVC()
    }
    
    //MARK: Custom Methods
    func addChildVC(){
        
        //add collection lists
        let usersList = UsersList.init(collectionViewLayout: FlowLayout.usersCollectionViewLayout)
        usersList.delegate = self
        self.addChild(usersList, to: usersListView)
        
        albumsList = AlbumsList.init(collectionViewLayout: FlowLayout.albumListCollectionViewLayout)
        self.addChild(albumsList, to: albumsListView)
        
        //add table lists
        postsList = PostsList.init(style: .plain)
        self.addChild(postsList, to: postsListView)
        
        todoList = ToDoList.init(style: .plain)
        self.addChild(todoList, to: todoListView)
        
    }

    //users list delegate
    func didSelect(userId: String) {
        UserId = userId
        postsList.getPostsList()
        albumsList.getAlbumsList()
        todoList.getTodoList()
    }
}

