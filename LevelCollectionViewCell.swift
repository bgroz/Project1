//
//  LevelCollectionViewCell.swift
//  CrossWordGame
//
//  Created by Buğra on 21.04.2017.
//  Copyright © 2017 Bartuğ Maden. All rights reserved.
//

import UIKit

class LevelCollectionViewCell: UICollectionViewCell {
    
    
    var levelImageView: UIImageView!
    
    
    override func awakeFromNib() {
        
        levelImageView = UIImageView(frame: contentView.frame)
        levelImageView.contentMode = .scaleAspectFill
        levelImageView.clipsToBounds = true
        contentView.addSubview(levelImageView)
        
    }

    
}
