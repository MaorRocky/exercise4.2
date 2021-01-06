//
//  MyCollectionViewCell.swift
//  exercise4.2V2
//
//  Created by Scores_Main_User on 1/6/21.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell
{

    @IBOutlet weak var numberLabel: UILabel!

    public func configure(with data: String)
    {
        self.numberLabel.text = String(data)
    }

}
