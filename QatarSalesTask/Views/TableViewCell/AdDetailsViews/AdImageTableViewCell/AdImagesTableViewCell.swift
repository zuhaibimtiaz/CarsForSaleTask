//
//  AdImagesTableViewCell.swift
//  ListGridProject
//
//  Created by Zuhaib  Imtiaz on 2/24/21.
//  Copyright © 2021 Zuhaib  Imtiaz. All rights reserved.
//

import UIKit

class AdImagesTableViewCell: UITableViewCell {

    @IBOutlet weak var adTitleLabel:UILabel!
    @IBOutlet weak var mainImageView:UIImageView!
    @IBOutlet weak var cornerImageView:UIButton!
    @IBOutlet weak var collectionView:UICollectionView!
    @IBOutlet weak var btnShowRoom:UIButton!
    @IBOutlet weak var newStarImageView:UIImageView!
    @IBOutlet weak var priceLabel:UILabel!
    @IBOutlet weak var btnPrevious:UIButton!
    @IBOutlet weak var btnForward:UIButton!

    var carDetails: SaleCarDetailsModel = SaleCarDetailsModel.init()
    var imagesCount = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(UINib(nibName: "OtherImagesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "OtherImagesCollectionViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func config(){
        self.mainImageView.set(url: URL.init(string: self.carDetails.images![1])!)
        self.adTitleLabel.text = self.carDetails.title
        self.priceLabel.text = self.carDetails.price
        self.cornerImageView.isSelected = self.carDetails.isSOLD ?? false
    }
    
    @IBAction func actionForward(_ sender: Any){
        self.imagesCount += 1
        if self.imagesCount > ((self.carDetails.images?.count)!-1){
            self.imagesCount = 0
            return
        }
        self.mainImageView.set(url: URL.init(string: self.carDetails.images![self.imagesCount])!)
    }
    
    @IBAction func actionBackWard(_ sender: Any){
        self.imagesCount -= 1
        if self.imagesCount < 0{
            self.imagesCount = ((self.carDetails.images?.count)!-1)
            return
        }
        self.mainImageView.set(url: URL.init(string: self.carDetails.images![self.imagesCount])!)

    }
    
    
}


extension AdImagesTableViewCell: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.carDetails.images?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OtherImagesCollectionViewCell", for: indexPath) as? OtherImagesCollectionViewCell{
            cell.otherImageView.set(url: URL.init(string: self.carDetails.images![indexPath.row])!)
            return cell
        }
        return UICollectionViewCell.init()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.mainImageView.set(url: URL.init(string: self.carDetails.images![indexPath.row])!)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 50)
    }
}
