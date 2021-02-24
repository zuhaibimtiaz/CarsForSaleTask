
import Foundation

class SaleCarDetailsModel : Codable {
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
    
    var briefDetails = [String]()

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

	required init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
        self.city = try values.decodeIfPresent(String.self, forKey: .city)
        self.city_ID = try values.decodeIfPresent(Int.self, forKey: .city_ID)
        self.class_ID = try values.decodeIfPresent(Int.self, forKey: .class_ID)
        self.colorID = try values.decodeIfPresent(Int.self, forKey: .colorID)
        self.comment = try values.decodeIfPresent(String.self, forKey: .comment)
        self.images = try values.decodeIfPresent([String].self, forKey: .images)
        self.insideColorID = try values.decodeIfPresent(Int.self, forKey: .insideColorID)
        self.langSubmit = try values.decodeIfPresent(Int.self, forKey: .langSubmit)
        self.makeName = try values.decodeIfPresent(String.self, forKey: .makeName)
        self.make_ID = try values.decodeIfPresent(Int.self, forKey: .make_ID)
        self.mandoob = try values.decodeIfPresent(Int.self, forKey: .mandoob)
        self.modelName = try values.decodeIfPresent(String.self, forKey: .modelName)
        self.model_ID = try values.decodeIfPresent(Int.self, forKey: .model_ID)
        self.outDate = try values.decodeIfPresent(String.self, forKey: .outDate)
        self.plateNo = try values.decodeIfPresent(String.self, forKey: .plateNo)
        self.plateSTAMP = try values.decodeIfPresent(String.self, forKey: .plateSTAMP)
        self.price = try values.decodeIfPresent(String.self, forKey: .price)
        self.recordID = try values.decodeIfPresent(Int.self, forKey: .recordID)
        self.seller = try values.decodeIfPresent(Int.self, forKey: .seller)
        self.sellerBanner = try values.decodeIfPresent(String.self, forKey: .sellerBanner)
        self.sellerBannerArabic = try values.decodeIfPresent(String.self, forKey: .sellerBannerArabic)
        self.sellerContact1 = try values.decodeIfPresent(String.self, forKey: .sellerContact1)
        self.sellerContact2 = try values.decodeIfPresent(String.self, forKey: .sellerContact2)
        self.sellerID = try values.decodeIfPresent(Int.self, forKey: .sellerID)
        self.sellerLatitude = try values.decodeIfPresent(String.self, forKey: .sellerLatitude)
        self.sellerLongitude = try values.decodeIfPresent(String.self, forKey: .sellerLongitude)
        self.sellerName = try values.decodeIfPresent(String.self, forKey: .sellerName)
        self.submitDate = try values.decodeIfPresent(String.self, forKey: .submitDate)
        self.submitType = try values.decodeIfPresent(String.self, forKey: .submitType)
        self.timeCode = try values.decodeIfPresent(String.self, forKey: .timeCode)
        self.title = try values.decodeIfPresent(String.self, forKey: .title)
        self.type_ID = try values.decodeIfPresent(Int.self, forKey: .type_ID)
        self.userID = try values.decodeIfPresent(String.self, forKey: .userID)
        self.userName = try values.decodeIfPresent(String.self, forKey: .userName)
        self.wheelDrive_ID = try values.decodeIfPresent(Int.self, forKey: .wheelDrive_ID)
        self.className = try values.decodeIfPresent(String.self, forKey: .className)
        self.importSource = try values.decodeIfPresent(String.self, forKey: .importSource)
        self.inDate = try values.decodeIfPresent(String.self, forKey: .inDate)
        self.isSOLD = try values.decodeIfPresent(Bool.self, forKey: .isSOLD)
        self.camera = try values.decodeIfPresent(String.self, forKey: .camera)
        if self.camera != nil{
            self.briefDetails.append(self.camera!)
        }
        self.dVD = try values.decodeIfPresent(String.self, forKey: .dVD)
        if self.dVD != nil{
            self.briefDetails.append(self.dVD!)
        }
        self.cD = try values.decodeIfPresent(String.self, forKey: .cD)
        if self.cD != nil{
            self.briefDetails.append(self.cD!)
        }
        self.bluetooth = try values.decodeIfPresent(String.self, forKey: .bluetooth)
        if self.bluetooth != nil{
            self.briefDetails.append(self.bluetooth!)
        }
        self.gPS = try values.decodeIfPresent(String.self, forKey: .gPS)
        if self.gPS != nil{
            self.briefDetails.append(self.gPS!)
        }
        self.mileage = try values.decodeIfPresent(String.self, forKey: .mileage)
        if self.mileage != nil{
            self.briefDetails.append(self.mileage!)
        }
        self.warranty = try values.decodeIfPresent(String.self, forKey: .warranty)
        if self.warranty != nil{
            self.briefDetails.append(self.warranty!)
        }
        self.advertiseDate = try values.decodeIfPresent(String.self, forKey: .advertiseDate)
        if self.advertiseDate != nil{
            self.briefDetails.append(self.advertiseDate!)
        }
        self.fuel = try values.decodeIfPresent(String.self, forKey: .fuel)
        if self.fuel != nil{
            self.briefDetails.append(self.fuel!)
        }
        self.bodyColor = try values.decodeIfPresent(String.self, forKey: .bodyColor)
        if self.bodyColor != nil{
            self.briefDetails.append(self.bodyColor!)
        }
        self.year = try values.decodeIfPresent(String.self, forKey: .year)
        if self.year != nil{
            self.briefDetails.append(self.year!)
        }
        self.cylinders = try values.decodeIfPresent(String.self, forKey: .cylinders)
        if self.cylinders != nil{
            self.briefDetails.append(self.cylinders!)
        }
        self.dTrain = try values.decodeIfPresent(String.self, forKey: .dTrain)
        if self.dTrain != nil{
            self.briefDetails.append(self.dTrain!)
        }
        self.insideColor = try values.decodeIfPresent(String.self, forKey:
            .insideColor)
        if self.insideColor != nil{
            self.briefDetails.append(self.insideColor!)
        }
        self.gearType = try values.decodeIfPresent(String.self, forKey: .gearType)
        if self.gearType != nil{
            self.briefDetails.append(self.gearType!)
        }
        self.seatType = try values.decodeIfPresent(String.self, forKey: .seatType)
        if self.seatType != nil{
            self.briefDetails.append(self.seatType!)
        }
        self.sRoof = try values.decodeIfPresent(String.self, forKey: .sRoof)
        if self.sRoof != nil{
            self.briefDetails.append(self.sRoof!)
        }
        self.sensors = try values.decodeIfPresent(String.self, forKey: .sensors)
        if self.sensors != nil{
            self.briefDetails.append(self.sensors!)
        }

	}

}
