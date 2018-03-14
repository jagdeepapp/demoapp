//
//  UsersModel.swift
//
//  Created by Jagdeep Singh on 14/03/18
//  Copyright (c) . All rights reserved.
//

import Foundation

public class UsersModel: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kUsersModelPhoneKey: String = "phone"
  private let kUsersModelNameKey: String = "name"
  private let kUsersModelEmailKey: String = "email"
  private let kUsersModelInternalIdentifierKey: String = "id"
  private let kUsersModelUsernameKey: String = "username"
  private let kUsersModelWebsiteKey: String = "website"

  // MARK: Properties
  public var phone: String?
  public var name: String?
  public var email: String?
  public var internalIdentifier: Int?
  public var username: String?
  public var website: String?

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
    phone = json[kUsersModelPhoneKey].string
    name = json[kUsersModelNameKey].string
    email = json[kUsersModelEmailKey].string
    internalIdentifier = json[kUsersModelInternalIdentifierKey].int
    username = json[kUsersModelUsernameKey].string
    website = json[kUsersModelWebsiteKey].string
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = phone { dictionary[kUsersModelPhoneKey] = value }
    if let value = name { dictionary[kUsersModelNameKey] = value }
    if let value = email { dictionary[kUsersModelEmailKey] = value }
    if let value = internalIdentifier { dictionary[kUsersModelInternalIdentifierKey] = value }
    if let value = username { dictionary[kUsersModelUsernameKey] = value }
    if let value = website { dictionary[kUsersModelWebsiteKey] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.phone = aDecoder.decodeObject(forKey: kUsersModelPhoneKey) as? String
    self.name = aDecoder.decodeObject(forKey: kUsersModelNameKey) as? String
    self.email = aDecoder.decodeObject(forKey: kUsersModelEmailKey) as? String
    self.internalIdentifier = aDecoder.decodeObject(forKey: kUsersModelInternalIdentifierKey) as? Int
    self.username = aDecoder.decodeObject(forKey: kUsersModelUsernameKey) as? String
    self.website = aDecoder.decodeObject(forKey: kUsersModelWebsiteKey) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(phone, forKey: kUsersModelPhoneKey)
    aCoder.encode(name, forKey: kUsersModelNameKey)
    aCoder.encode(email, forKey: kUsersModelEmailKey)
    aCoder.encode(internalIdentifier, forKey: kUsersModelInternalIdentifierKey)
    aCoder.encode(username, forKey: kUsersModelUsernameKey)
    aCoder.encode(website, forKey: kUsersModelWebsiteKey)
  }

}
