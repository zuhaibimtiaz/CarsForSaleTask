

import Foundation

class SaleCarDetailMainResponseModel : Codable {
    
	var isResponseSuccessful : Bool?
	var responseMessage : String?
	var adsListData : String?
	var appSettings : String?
	var bikeDetail : String?
	var bikesInfo : String?
	var bikesLookupData : String?
	var mainSponsors : String?
	var rentCarDetails : String?
	var rentCarsInfo : String?
	var rentCarsLookupData : String?
	var resource : String?
	var saleCarDetails : SaleCarDetailsModel?
	var saleCarsInfo : String?
	var saleCarsLookupData : String?
	var showRoomCities : String?
	var showRoomLocations : String?
	var showRooms : String?
	var showRoomsRent : String?
	var showroomDetails : String?
	var superAds : String?
	var superAdsBikes : String?
	var superAdsRent : String?
	var userContacts : String?
	var userNotifications : String?
	var userProfile : String?

	enum CodingKeys: String, CodingKey {

		case isResponseSuccessful = "IsResponseSuccessful"
		case responseMessage = "ResponseMessage"
		case adsListData = "AdsListData"
		case appSettings = "AppSettings"
		case bikeDetail = "BikeDetail"
		case bikesInfo = "BikesInfo"
		case bikesLookupData = "BikesLookupData"
		case mainSponsors = "MainSponsors"
		case rentCarDetails = "RentCarDetails"
		case rentCarsInfo = "RentCarsInfo"
		case rentCarsLookupData = "RentCarsLookupData"
		case resource = "Resource"
		case saleCarDetails = "SaleCarDetails"
		case saleCarsInfo = "SaleCarsInfo"
		case saleCarsLookupData = "SaleCarsLookupData"
		case showRoomCities = "ShowRoomCities"
		case showRoomLocations = "ShowRoomLocations"
		case showRooms = "ShowRooms"
		case showRoomsRent = "ShowRoomsRent"
		case showroomDetails = "ShowroomDetails"
		case superAds = "SuperAds"
		case superAdsBikes = "SuperAdsBikes"
		case superAdsRent = "SuperAdsRent"
		case userContacts = "UserContacts"
		case userNotifications = "UserNotifications"
		case userProfile = "UserProfile"
	}

	required init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
        self.isResponseSuccessful = try values.decodeIfPresent(Bool.self, forKey: .isResponseSuccessful)
        self.responseMessage = try values.decodeIfPresent(String.self, forKey: .responseMessage)
        self.adsListData = try values.decodeIfPresent(String.self, forKey: .adsListData)
        self.appSettings = try values.decodeIfPresent(String.self, forKey: .appSettings)
        self.bikeDetail = try values.decodeIfPresent(String.self, forKey: .bikeDetail)
        self.bikesInfo = try values.decodeIfPresent(String.self, forKey: .bikesInfo)
        self.bikesLookupData = try values.decodeIfPresent(String.self, forKey: .bikesLookupData)
        self.mainSponsors = try values.decodeIfPresent(String.self, forKey: .mainSponsors)
        self.rentCarDetails = try values.decodeIfPresent(String.self, forKey: .rentCarDetails)
        self.rentCarsInfo = try values.decodeIfPresent(String.self, forKey: .rentCarsInfo)
        self.rentCarsLookupData = try values.decodeIfPresent(String.self, forKey: .rentCarsLookupData)
        self.resource = try values.decodeIfPresent(String.self, forKey: .resource)
        self.saleCarDetails = try values.decodeIfPresent(SaleCarDetailsModel.self, forKey: .saleCarDetails)
        self.saleCarsInfo = try values.decodeIfPresent(String.self, forKey: .saleCarsInfo)
        self.saleCarsLookupData = try values.decodeIfPresent(String.self, forKey: .saleCarsLookupData)
        self.showRoomCities = try values.decodeIfPresent(String.self, forKey: .showRoomCities)
        self.showRoomLocations = try values.decodeIfPresent(String.self, forKey: .showRoomLocations)
        self.showRooms = try values.decodeIfPresent(String.self, forKey: .showRooms)
        self.showRoomsRent = try values.decodeIfPresent(String.self, forKey: .showRoomsRent)
        self.showroomDetails = try values.decodeIfPresent(String.self, forKey: .showroomDetails)
        self.superAds = try values.decodeIfPresent(String.self, forKey: .superAds)
        self.superAdsBikes = try values.decodeIfPresent(String.self, forKey: .superAdsBikes)
        self.superAdsRent = try values.decodeIfPresent(String.self, forKey: .superAdsRent)
        self.userContacts = try values.decodeIfPresent(String.self, forKey: .userContacts)
        self.userNotifications = try values.decodeIfPresent(String.self, forKey: .userNotifications)
        self.userProfile = try values.decodeIfPresent(String.self, forKey: .userProfile)
	}

}
