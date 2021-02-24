//
//  AdCollectionViewCell.swift
//  ListGridProject
//
//  Created by Zuhaib  Imtiaz on 2/24/21.
//  Copyright © 2021 Zuhaib  Imtiaz. All rights reserved.
//

import UIKit

class MainListCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel:UILabel!
    @IBOutlet weak var milageLabel:UILabel!
    @IBOutlet weak var yearLabel:UILabel!
    @IBOutlet weak var gearLabel:UILabel!
    @IBOutlet weak var cylinderLabel:UILabel!
    @IBOutlet weak var personalLabel:UILabel!
    @IBOutlet weak var personalImageLabel:UIImageView!
    @IBOutlet weak var priceLabel:UILabel!
    @IBOutlet weak var mainImageView:UIImageView!
    @IBOutlet weak var cornerImageViewBtn:UIButton!
    @IBOutlet weak var favImageView:UIButton!


    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func config(carInfo: CarsList){
        self.titleLabel.text = carInfo.title
        self.milageLabel.text = carInfo.mileage
        self.yearLabel.text = carInfo.year
        self.gearLabel.text = carInfo.gearType
        self.cylinderLabel.text = "\(carInfo.cylinders ?? "") cylinder"
        self.personalLabel.text = carInfo.title
        self.priceLabel.text = carInfo.price
        self.cornerImageViewBtn.isSelected = carInfo.isSOLD ?? false
        self.mainImageView.set(url:URL.init(string: (carInfo.images?.first)!)!)
    }

    
    @IBAction func actionFav(_ sender:Any){
        self.favImageView.isSelected.toggle()
    }
}
