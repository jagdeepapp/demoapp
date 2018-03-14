//
//  PostsModel.swift
//
//  Created by Jagdeep Singh on 14/03/18
//  Copyright (c) . All rights reserved.
//

import Foundation

public class PostsModel: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kPostsModelTitleKey: String = "title"
  private let kPostsModelUserIdKey: String = "userId"
  private let kPostsModelInternalIdentifierKey: String = "id"
  private let kPostsModelBodyKey: String = "body"

  // MARK: Properties
  public var title: String?
  public var userId: Int?
  public var internalIdentifier: Int?
  public var body: String?

  // MARK: SwiftyJSON Initalizers
  /**
   Initates the instance based on the object
   - parameter object: The object of either Dictionary or Array kind that was passed.
   - returns: An initalized instance of the class.
  */
  convenience public init(object: Any) {
    self.init(json: JSON(object))
  }

  /**
   Initates the instance based on the JSON that was passed.
   - parameter json: JSON object from SwiftyJSON.
   - returns: An initalized instance of the class.
  */
  public init(json: JSON) {
    title = json[kPostsModelTitleKey].string
    userId = json[kPostsModelUserIdKey].int
    internalIdentifier = json[kPostsModelInternalIdentifierKey].int
    body = json[kPostsModelBodyKey].string
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = title { dictionary[kPostsModelTitleKey] = value }
    if let value = userId { dictionary[kPostsModelUserIdKey] = value }
    if let value = internalIdentifier { dictionary[kPostsModelInternalIdentifierKey] = value }
    if let value = body { dictionary[kPostsModelBodyKey] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.title = aDecoder.decodeObject(forKey: kPostsModelTitleKey) as? String
    self.userId = aDecoder.decodeObject(forKey: kPostsModelUserIdKey) as? Int
    self.internalIdentifier = aDecoder.decodeObject(forKey: kPostsModelInternalIdentifierKey) as? Int
    self.body = aDecoder.decodeObject(forKey: kPostsModelBodyKey) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(title, forKey: kPostsModelTitleKey)
    aCoder.encode(userId, forKey: kPostsModelUserIdKey)
    aCoder.encode(internalIdentifier, forKey: kPostsModelInternalIdentifierKey)
    aCoder.encode(body, forKey: kPostsModelBodyKey)
  }

}
