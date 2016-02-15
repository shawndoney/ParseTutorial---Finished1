//
//  WallPost.swift
//  ParseTutorial
//
//  Created by Ron Kliffer on 3/8/15.
//  Copyright (c) 2015 Ron Kliffer. All rights reserved.
//

import Foundation

class WallPost: PFObject, PFSubclassing {
  @NSManaged var image: PFFile?
  @NSManaged var user: PFUser
  @NSManaged var comment: String?
  //@NSManaged var title: String?
  //@NSManaged var url: String?
  //@NSManaged var startDate: String?
  //@NSManaged var findValue: String?
  //@NSManaged var startingValue: String?
  //@NSManaged var notificationValue: String?
  //@NSManaged var searchActive: String?
  
  

  //1
  class func parseClassName() -> String {
    return "WallPost"
  }
  
  //2
  override class func initialize() {
    var onceToken: dispatch_once_t = 0
    dispatch_once(&onceToken) {
      self.registerSubclass()
    }
  }
  
  override class func query() -> PFQuery? {
    let query = PFQuery(className: WallPost.parseClassName()) //1
    query.includeKey("user") //2
    query.orderByDescending("createdAt") //3
    return query
  }
  
  init(image: PFFile, user: PFUser, comment: String?) {
    super.init()
    
    self.image = image
    self.user = user
    self.comment = comment
  }
  /*
  init(user: PFUser, title: String?, url: String?, startDate: String?, findValue: String?, startingValue: String?, notificationValue: String?, searchActive: String?) {
    super.init()
    
    self.user = user
    self.title = title
    self.url = url
    self.startDate = startDate
    self.findValue = findValue
    self.startingValue = startingValue
    self.notificationValue  = notificationValue
    self.searchActive = searchActive
  }
  */
  override init() {
    super.init()
  }
  
}
