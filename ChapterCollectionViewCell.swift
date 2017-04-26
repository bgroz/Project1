//
//  MyCollectionViewCell.swift
//  CrossWordGame
//
//  Created by Buğra on 26.04.2017.
//  Copyright © 2017 Bartuğ Maden. All rights reserved.
//

import UIKit

class ChapterCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var txtField: UITextField!

    override func awakeFromNib() {
        
        txtField.backgroundColor = .white
        txtField.autocapitalizationType = .allCharacters
        txtField.autocorrectionType = .no
        txtField.becomeFirstResponder()
    }
}
