//
//  CarsForSaleViewController.swift
//  ListGridProject
//
//  Created by Zuhaib  Imtiaz on 2/24/21.
//  Copyright © 2021 Zuhaib  Imtiaz. All rights reserved.
//

import UIKit

class CarsForSaleViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var viewModel: CarsSalesViewModel!
    var pageNo = 1
    var requestIndex = 0
    var adIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.config()
        
    }
    
    func config(){
        viewModel = CarsSalesViewModel(delegate: self, viewController: self)
        viewModel.getCarSaleListingRequest(orderBy: 0, pageNo: self.pageNo, pageSize: 10, sortColumn: "-1")
        GCD.async(.Main) {
            self.startActivity()
        }
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(UINib(nibName: "MainListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MainListCollectionViewCell")
        self.collectionView.register(UINib(nibName: "AdCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AdCollectionViewCell")
    }
}

extension CarsForSaleViewController: CarsSalesViewModelDelegate{
    func onSuccess() {
        GCD.async(.Main) {
            self.stopActivity()
        }
        self.adIndex = 1
        self.collectionView.reloadData()
    }
    
    func onFaild(with error: String) {
        GCD.async(.Main) {
            self.stopActivity()
        }
        print("error: ", error)
    }
}

extension CarsForSaleViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let addition = ceil(Double(self.viewModel.totalCarsForSale)/5.0)
        return self.viewModel.totalCarsForSale + Int(addition) + self.adIndex
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row % 5 == 0{
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AdCollectionViewCell", for: indexPath) as? AdCollectionViewCell{
                cell.adImageView.image = UIImage.init(named: "ads_image")
                return cell
            }
        }else{
            var index = indexPath.row - (indexPath.row/5)
            index = index - 1

            let car = viewModel.carForSale(at: index)
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainListCollectionViewCell", for: indexPath) as? MainListCollectionViewCell{
                cell.config(carInfo: car)
                return cell
            }
        }
        return UICollectionViewCell.init()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.row % 5 == 0{
        }
        else{
            var index = indexPath.row - (indexPath.row/5)
            index = index - 1
            let car = viewModel.carForSale(at: index)
            if let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AdDetailsViewController") as? AdDetailsViewController{
                vc.carRecordId = car.recordID ?? -1
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == self.viewModel.totalCarsForSale-1{
            guard !self.viewModel.isPaginating else {
                return
            }
            self.viewModel.getCarSaleListingRequest(pagination: true, orderBy: 0, pageNo: self.pageNo+1, pageSize: 20, sortColumn: "-1")
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.size.width, height: 112)
    }
    
}
