/* 
Copyright (c) 2021 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation

class CarsList : Codable {
	var advertiseDate : String?
	var bodyColor : String?
	var city : String?
	var city_ID : Int?
	var class_ID : Int?
	var colorID : Int?
	var comment : String?
	var cylinders : String?
	var gearType : String?
	var images : [String]?
	var insideColorID : Int?
	var langSubmit : Int?
	var makeName : String?
	var make_ID : Int?
	var mandoob : Int?
	var mileage : String?
	var modelName : String?
	var model_ID : Int?
	var outDate : String?
	var plateNo : String?
	var plateSTAMP : String?
	var price : String?
	var recordID : Int?
	var seller : Int?
	var sellerBanner : String?
	var sellerBannerArabic : String?
	var sellerContact1 : String?
	var sellerContact2 : String?
	var sellerID : Int?
	var sellerLatitude : String?
	var sellerLongitude : String?
	var sellerName : String?
	var submitDate : String?
	var submitType : String?
	var timeCode : String?
	var title : String?
	var type_ID : Int?
	var userID : String?
	var userName : String?
	var warranty : String?
	var wheelDrive_ID : Int?
	var year : String?
	var bluetooth : String?
	var cD : String?
	var camera : String?
	var className : String?
	var dTrain : String?
	var dVD : String?
	var fuel : String?
	var gPS : String?
	var importSource : String?
	var inDate : String?
	var insideColor : String?
	var isSOLD : Bool?
	var sRoof : String?
	var seatType : String?
	var sensors : String?
    var isAd:Bool = false

	enum CodingKeys: String, CodingKey {

		case advertiseDate = "AdvertiseDate"
		case bodyColor = "BodyColor"
		case city = "City"
		case city_ID = "City_ID"
		case class_ID = "Class_ID"
		case colorID = "ColorID"
		case comment = "Comment"
		case cylinders = "Cylinders"
		case gearType = "GearType"
		case images = "Images"
		case insideColorID = "InsideColorID"
		case langSubmit = "LangSubmit"
		case makeName = "MakeName"
		case make_ID = "Make_ID"
		case mandoob = "Mandoob"
		case mileage = "Mileage"
		case modelName = "ModelName"
		case model_ID = "Model_ID"
		case outDate = "OutDate"
		case plateNo = "PlateNo"
		case plateSTAMP = "PlateSTAMP"
		case price = "Price"
		case recordID = "RecordID"
		case seller = "Seller"
		case sellerBanner = "SellerBanner"
		case sellerBannerArabic = "SellerBannerArabic"
		case sellerContact1 = "SellerContact1"
		case sellerContact2 = "SellerContact2"
		case sellerID = "SellerID"
		case sellerLatitude = "SellerLatitude"
		case sellerLongitude = "SellerLongitude"
		case sellerName = "SellerName"
		case submitDate = "SubmitDate"
		case submitType = "SubmitType"
		case timeCode = "TimeCode"
		case title = "Title"
		case type_ID = "Type_ID"
		case userID = "UserID"
		case userName = "UserName"
		case warranty = "Warranty"
		case wheelDrive_ID = "WheelDrive_ID"
		case year = "Year"
		case bluetooth = "Bluetooth"
		case cD = "CD"
		case camera = "Camera"
		case className = "ClassName"
		case dTrain = "DTrain"
		case dVD = "DVD"
		case fuel = "Fuel"
		case gPS = "GPS"
		case importSource = "ImportSource"
		case inDate = "InDate"
		case insideColor = "InsideColor"
		case isSOLD = "IsSOLD"
		case sRoof = "SRoof"
		case seatType = "SeatType"
		case sensors = "Sensors"
	}
    init(){
        
    }

    init(isAdd:Bool){
        self.isAd = isAdd
    }
	required init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		advertiseDate = try values.decodeIfPresent(String.self, forKey: .advertiseDate)
		bodyColor = try values.decodeIfPresent(String.self, forKey: .bodyColor)
		city = try values.decodeIfPresent(String.self, forKey: .city)
		city_ID = try values.decodeIfPresent(Int.self, forKey: .city_ID)
		class_ID = try values.decodeIfPresent(Int.self, forKey: .class_ID)
		colorID = try values.decodeIfPresent(Int.self, forKey: .colorID)
		comment = try values.decodeIfPresent(String.self, forKey: .comment)
		cylinders = try values.decodeIfPresent(String.self, forKey: .cylinders)
		gearType = try values.decodeIfPresent(String.self, forKey: .gearType)
		images = try values.decodeIfPresent([String].self, forKey: .images)
		insideColorID = try values.decodeIfPresent(Int.self, forKey: .insideColorID)
		langSubmit = try values.decodeIfPresent(Int.self, forKey: .langSubmit)
		makeName = try values.decodeIfPresent(String.self, forKey: .makeName)
		make_ID = try values.decodeIfPresent(Int.self, forKey: .make_ID)
		mandoob = try values.decodeIfPresent(Int.self, forKey: .mandoob)
		mileage = try values.decodeIfPresent(String.self, forKey: .mileage)
		modelName = try values.decodeIfPresent(String.self, forKey: .modelName)
		model_ID = try values.decodeIfPresent(Int.self, forKey: .model_ID)
		outDate = try values.decodeIfPresent(String.self, forKey: .outDate)
		plateNo = try values.decodeIfPresent(String.self, forKey: .plateNo)
		plateSTAMP = try values.decodeIfPresent(String.self, forKey: .plateSTAMP)
		price = try values.decodeIfPresent(String.self, forKey: .price)
		recordID = try values.decodeIfPresent(Int.self, forKey: .recordID)
		seller = try values.decodeIfPresent(Int.self, forKey: .seller)
		sellerBanner = try values.decodeIfPresent(String.self, forKey: .sellerBanner)
		sellerBannerArabic = try values.decodeIfPresent(String.self, forKey: .sellerBannerArabic)
		sellerContact1 = try values.decodeIfPresent(String.self, forKey: .sellerContact1)
		sellerContact2 = try values.decodeIfPresent(String.self, forKey: .sellerContact2)
		sellerID = try values.decodeIfPresent(Int.self, forKey: .sellerID)
		sellerLatitude = try values.decodeIfPresent(String.self, forKey: .sellerLatitude)
		sellerLongitude = try values.decodeIfPresent(String.self, forKey: .sellerLongitude)
		sellerName = try values.decodeIfPresent(String.self, forKey: .sellerName)
		submitDate = try values.decodeIfPresent(String.self, forKey: .submitDate)
		submitType = try values.decodeIfPresent(String.self, forKey: .submitType)
		timeCode = try values.decodeIfPresent(String.self, forKey: .timeCode)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		type_ID = try values.decodeIfPresent(Int.self, forKey: .type_ID)
		userID = try values.decodeIfPresent(String.self, forKey: .userID)
		userName = try values.decodeIfPresent(String.self, forKey: .userName)
		warranty = try values.decodeIfPresent(String.self, forKey: .warranty)
		wheelDrive_ID = try values.decodeIfPresent(Int.self, forKey: .wheelDrive_ID)
		year = try values.decodeIfPresent(String.self, forKey: .year)
		bluetooth = try values.decodeIfPresent(String.self, forKey: .bluetooth)
		cD = try values.decodeIfPresent(String.self, forKey: .cD)
		camera = try values.decodeIfPresent(String.self, forKey: .camera)
		className = try values.decodeIfPresent(String.self, forKey: .className)
		dTrain = try values.decodeIfPresent(String.self, forKey: .dTrain)
		dVD = try values.decodeIfPresent(String.self, forKey: .dVD)
		fuel = try values.decodeIfPresent(String.self, forKey: .fuel)
		gPS = try values.decodeIfPresent(String.self, forKey: .gPS)
		importSource = try values.decodeIfPresent(String.self, forKey: .importSource)
		inDate = try values.decodeIfPresent(String.self, forKey: .inDate)
		insideColor = try values.decodeIfPresent(String.self, forKey: .insideColor)
		isSOLD = try values.decodeIfPresent(Bool.self, forKey: .isSOLD)
		sRoof = try values.decodeIfPresent(String.self, forKey: .sRoof)
		seatType = try values.decodeIfPresent(String.self, forKey: .seatType)
		sensors = try values.decodeIfPresent(String.self, forKey: .sensors)
	}

}
