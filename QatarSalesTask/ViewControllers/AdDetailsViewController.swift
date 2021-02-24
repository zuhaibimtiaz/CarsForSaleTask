//
//  AdDetailsViewController.swift
//  ListGridProject
//
//  Created by Zuhaib  Imtiaz on 2/24/21.
//  Copyright © 2021 Zuhaib  Imtiaz. All rights reserved.
//

import UIKit

class AdDetailsViewController: UIViewController {

    @IBOutlet weak var tableView:UITableView!
    var viewModel: CarDetailsViewModel!

    var carRecordId = -1
    var rows = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.config()
    }
    
    func config(){
        viewModel = CarDetailsViewModel(delegate: self, viewController: self)
        if self.carRecordId == -1{
            print("Something Wrong, Try again!")
        }else{
            viewModel.getCarDetails(recordId: self.carRecordId)
            GCD.async(.Main) {
                self.startActivity()
            }
        }

        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "AdImagesTableViewCell", bundle: nil), forCellReuseIdentifier: "AdImagesTableViewCell")
        self.tableView.register(UINib(nibName: "AdBriefDetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "AdBriefDetailsTableViewCell")
        self.tableView.register(UINib(nibName: "AdOwnerInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "AdOwnerInfoTableViewCell")

    }
    
    @IBAction func actionBack(_ sender: Any){
        self.navigationController?.popViewController(animated: true)
    }
}

extension AdDetailsViewController: CarDetailsViewModelDelegate{
    func onSuccess() {
        GCD.async(.Main) {
            self.stopActivity()
        }
        self.rows = 3
        self.tableView.reloadData()
    }
    
    func onFaild(with error: String) {
        GCD.async(.Main) {
            self.stopActivity()
        }
        print("error: ", error)
    }
}

extension AdDetailsViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.rows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let info = self.viewModel.saleCarDetails
        if indexPath.row == 0{
            if let cell = tableView.dequeueReusableCell(withIdentifier: "AdImagesTableViewCell", for: indexPath) as? AdImagesTableViewCell{
                cell.carDetails = info
                cell.config()
                return cell
            }
        }else if indexPath.row == 1{
            if let cell = tableView.dequeueReusableCell(withIdentifier: "AdBriefDetailsTableViewCell", for: indexPath) as? AdBriefDetailsTableViewCell{
                cell.carDetails = info
                cell.config()
            return cell
            }
        }else{
            if let cell = tableView.dequeueReusableCell(withIdentifier: "AdOwnerInfoTableViewCell", for: indexPath) as? AdOwnerInfoTableViewCell{
                if info.sellerContact1 != "" && info.sellerContact2 != ""{
                    cell.config(phoneNumbers: [info.sellerContact1!,info.sellerContact2!],sellerLocation:info.sellerName!)
                }else{
                    cell.config(phoneNumbers: [info.sellerContact1!],sellerLocation:info.sellerName!)

                }
                return cell
            }
        }
        return UITableViewCell.init()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 465
        }else if indexPath.row == 1{
            return 680
        }else{
            return 100
        }
    }
    
    
}
