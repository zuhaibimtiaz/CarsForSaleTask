//
//  AdOwnerInfoTableViewCell.swift
//  ListGridProject
//
//  Created by Zuhaib  Imtiaz on 2/24/21.
//  Copyright © 2021 Zuhaib  Imtiaz. All rights reserved.
//

import UIKit

class AdOwnerInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var locationView:UIView!
    @IBOutlet weak var locationTitle:UILabel!
    @IBOutlet weak var phoneNoView:UIView!
    @IBOutlet weak var collectionView:UICollectionView!

    var phoneNos = [String]()
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(UINib(nibName: "PhoneNoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PhoneNoCollectionViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func config(phoneNumbers:[String], sellerLocation:String){
        self.phoneNos = phoneNumbers
        if sellerLocation != ""{
            self.locationTitle.text = sellerLocation
        }else{
            self.locationView.isHidden = true
        }
    }
    
}


extension AdOwnerInfoTableViewCell: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.phoneNos.count == 0 ? (self.phoneNoView.isHidden = true) : (self.phoneNoView.isHidden = false)
        return self.phoneNos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhoneNoCollectionViewCell", for: indexPath) as? PhoneNoCollectionViewCell{
            cell.phoneNoLabel.text = self.phoneNos[indexPath.row]
            return cell
        }        
        return UICollectionViewCell.init()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 150, height: 40)
    }
    
}
