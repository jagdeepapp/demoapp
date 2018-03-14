//
//  JSUIImageView_Ext.swift
//  GampzApp
//
//  Created by CSPC178 on 23/06/17.
//  Copyright © 2017 CSPC178cs. All rights reserved.
//

import Foundation


extension UIImageView {
    

    func setImage(url:URL?, placeholderImage:UIImage?) {
                
        if url != nil {
           
            self.sd_setImage(with: url, placeholderImage: placeholderImage, options: [ .retryFailed,.refreshCached], completed: { (image: UIImage?, error: Error?, cacheType: SDImageCacheType, imageURL: URL?) in
                if image != nil{
                    self.contentMode = .scaleAspectFill
                }
            })
        }
        
    }
    
}
