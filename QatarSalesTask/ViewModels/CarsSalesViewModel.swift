//
//  CarsSalesViewModel.swift
//  ListGridProject
//
//  Created by Zuhaib  Imtiaz on 2/24/21.
//  Copyright © 2021 Zuhaib  Imtiaz. All rights reserved.
//

import UIKit

protocol CarsSalesViewModelDelegate {
    func onSuccess()
    func onFaild(with error: String)
}

class CarsSalesViewModel: NSObject {
    var delegate: CarsSalesViewModelDelegate?
    var viewController: UIViewController!
    var carForSalesList: [CarsList] = []
    
    var isPaginating = false
    var totalCarsForSale: Int {
        return self.carForSalesList.count
    }
    
    func carForSale(at index: Int) -> CarsList {
        return self.carForSalesList[index]
    }
    
    init(delegate: CarsSalesViewModelDelegate, viewController: UIViewController) {
        self.viewController = viewController
        self.delegate = delegate
    }
    
    func getCarSaleListingRequest(pagination:Bool = false,orderBy:Int = 0, pageNo:Int = 1, pageSize:Int = 20, sortColumn:String = "-1"){
        
        if pagination{
            isPaginating = true
        }
        
        let subParam: [String:Any] = [
            "OrderBy"      : orderBy,
            "PageNo"       : pageNo,
            "PageSize"     : pageSize,
            "SortByColumn" : sortColumn
        ]
        
        let param: [String:Any] = [
            "ModeOfLanguage"            : NSLocale.current.languageCode == "ar" ? "ar" : "en",
            "SearchCriteriaForSaleCars" : subParam
        ]
        let service = CarsForSaleService()
        GCD.async(.Default) {
            service.carsForSalesRequest(params: param) { (serviceResponse) in
                switch serviceResponse.serviceResponseType {
                case .Success :
                    GCD.async(.Main) {
                        if let carsInfo = serviceResponse.data as? SaleCarsInfo {
                            self.carForSalesList.append(contentsOf: carsInfo.dataList!)
                            self.delegate?.onSuccess()
                            if pagination{
                                self.isPaginating = false
                            }
                        }
                        else {
                            self.delegate?.onFaild(with: "failing")
                            if pagination{
                                self.isPaginating = false
                            }
                            
                            print("Cars not found")
                        }
                    }
                case .Failure :
                    GCD.async(.Main) {
                        self.delegate?.onFaild(with: "failing")
                        if pagination{
                            self.isPaginating = false
                        }
                        
                        print("Cars not found")
                    }
                default :
                    GCD.async(.Main) {
                        self.delegate?.onFaild(with: "failing")
                        if pagination{
                            self.isPaginating = false
                        }
                        
                        print("Cars not found")
                    }
                }
            }
        }
    }
}
