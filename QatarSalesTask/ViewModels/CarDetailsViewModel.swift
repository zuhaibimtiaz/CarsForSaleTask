//
//  CarDetailsViewModel.swift
//  ListGridProject
//
//  Created by Zuhaib  Imtiaz on 2/24/21.
//  Copyright © 2021 Zuhaib  Imtiaz. All rights reserved.
//

import Foundation
import UIKit

protocol CarDetailsViewModelDelegate {
    func onSuccess()
    func onFaild(with error: String)
}

class CarDetailsViewModel: NSObject {
    var delegate: CarDetailsViewModelDelegate?
    var viewController: UIViewController!
    var saleCarDetails: SaleCarDetailsModel = SaleCarDetailsModel.init()

//    var totalCarsForSale: Int {
//        return self.carForSalesList.count
//    }
    
//    func carForSale(at index: Int) -> CarsList {
//        return self.carForSalesList[index]
//    }
    
    init(delegate: CarDetailsViewModelDelegate, viewController: UIViewController) {
        self.viewController = viewController
        self.delegate = delegate
    }

    func getCarDetails(recordId:Int){
        let param: [String:Any] = [
            "ModeOfLanguage"    : NSLocale.current.languageCode == "ar" ? "ar" : "en",
            "RecordID"          : recordId,
            "IsPending"         : 0
        ]
        let service = CarsForSaleService()
        GCD.async(.Default) {
            service.carsDetailsRequest(params: param) { (serviceResponse) in
                switch serviceResponse.serviceResponseType {
                case .Success :
                    GCD.async(.Main) {
                        if let carsInfo = serviceResponse.data as? SaleCarDetailsModel {
                            self.saleCarDetails = carsInfo
                            self.delegate?.onSuccess()
                        }
                        else {
                            self.delegate?.onFaild(with: "failing")
                            print("Cars not found")
                        }
                    }
                case .Failure :
                    GCD.async(.Main) {
                        self.delegate?.onFaild(with: "failing")
                        print("Cars not found")
                    }
                default :
                    GCD.async(.Main) {
                        self.delegate?.onFaild(with: "failing")
                        print("Cars not found")
                    }
                }
            }
        }
    }
}
