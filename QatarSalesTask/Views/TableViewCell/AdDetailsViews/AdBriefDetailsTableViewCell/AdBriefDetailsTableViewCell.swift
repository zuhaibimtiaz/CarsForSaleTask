//
//  AdBriefDetailsTableViewCell.swift
//  ListGridProject
//
//  Created by Zuhaib  Imtiaz on 2/24/21.
//  Copyright © 2021 Zuhaib  Imtiaz. All rights reserved.
//

import UIKit

class AdBriefDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var tableView:UITableView!
    var carDetails: SaleCarDetailsModel = SaleCarDetailsModel.init()
    var mainTitlesArray = ["Camera","DVD","CD","Bluetooth","GPS","Mileage(KM)","Warranty","Adv Date","Fuel","Body Color","Year","No. Cylinder","D.Train","Inside Color","Gear Type", "Seat Type","S.Roof","Sensors"]
    override func awakeFromNib() {
        super.awakeFromNib()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "AdSubDetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "AdSubDetailsTableViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func config(){
        
    }
    
}


extension AdBriefDetailsTableViewCell: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.mainTitlesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "AdSubDetailsTableViewCell", for: indexPath) as? AdSubDetailsTableViewCell{
            cell.headingTitleLabel.text = self.mainTitlesArray[indexPath.row]
            cell.titleLabel.text = self.carDetails.briefDetails[indexPath.row]
            if indexPath.row % 2 == 0{
                cell.backView.backgroundColor = UIColor.init(hexString: "#5B0319")
            }else{
                cell.backView.backgroundColor = UIColor.init(hexString: "#3B0012")
            }
            return cell
        }
        return UITableViewCell.init()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 34
    }
}
