//
//  AlbumModel.swift
//
//  Created by Jagdeep Singh on 14/03/18
//  Copyright (c) . All rights reserved.
//

import Foundation

public class AlbumModel: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kAlbumModelAlbumIdKey: String = "albumId"
  private let kAlbumModelTitleKey: String = "title"
  private let kAlbumModelInternalIdentifierKey: String = "id"
  private let kAlbumModelUrlKey: String = "url"
  private let kAlbumModelThumbnailUrlKey: String = "thumbnailUrl"

  // MARK: Properties
  public var albumId: Int?
  public var title: String?
  public var internalIdentifier: Int?
  public var url: String?
  public var thumbnailUrl: String?

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
    albumId = json[kAlbumModelAlbumIdKey].int
    title = json[kAlbumModelTitleKey].string
    internalIdentifier = json[kAlbumModelInternalIdentifierKey].int
    url = json[kAlbumModelUrlKey].string
    thumbnailUrl = json[kAlbumModelThumbnailUrlKey].string
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = albumId { dictionary[kAlbumModelAlbumIdKey] = value }
    if let value = title { dictionary[kAlbumModelTitleKey] = value }
    if let value = internalIdentifier { dictionary[kAlbumModelInternalIdentifierKey] = value }
    if let value = url { dictionary[kAlbumModelUrlKey] = value }
    if let value = thumbnailUrl { dictionary[kAlbumModelThumbnailUrlKey] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.albumId = aDecoder.decodeObject(forKey: kAlbumModelAlbumIdKey) as? Int
    self.title = aDecoder.decodeObject(forKey: kAlbumModelTitleKey) as? String
    self.internalIdentifier = aDecoder.decodeObject(forKey: kAlbumModelInternalIdentifierKey) as? Int
    self.url = aDecoder.decodeObject(forKey: kAlbumModelUrlKey) as? String
    self.thumbnailUrl = aDecoder.decodeObject(forKey: kAlbumModelThumbnailUrlKey) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(albumId, forKey: kAlbumModelAlbumIdKey)
    aCoder.encode(title, forKey: kAlbumModelTitleKey)
    aCoder.encode(internalIdentifier, forKey: kAlbumModelInternalIdentifierKey)
    aCoder.encode(url, forKey: kAlbumModelUrlKey)
    aCoder.encode(thumbnailUrl, forKey: kAlbumModelThumbnailUrlKey)
  }

}
