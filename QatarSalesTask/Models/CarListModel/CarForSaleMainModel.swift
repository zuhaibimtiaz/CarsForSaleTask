

import Foundation

class CarForSaleMainModel : Codable {
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
	var saleCarDetails : String?
	var saleCarsInfo : SaleCarsInfo?
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
		isResponseSuccessful = try values.decodeIfPresent(Bool.self, forKey: .isResponseSuccessful)
		responseMessage = try values.decodeIfPresent(String.self, forKey: .responseMessage)
		adsListData = try values.decodeIfPresent(String.self, forKey: .adsListData)
		appSettings = try values.decodeIfPresent(String.self, forKey: .appSettings)
		bikeDetail = try values.decodeIfPresent(String.self, forKey: .bikeDetail)
		bikesInfo = try values.decodeIfPresent(String.self, forKey: .bikesInfo)
		bikesLookupData = try values.decodeIfPresent(String.self, forKey: .bikesLookupData)
		mainSponsors = try values.decodeIfPresent(String.self, forKey: .mainSponsors)
		rentCarDetails = try values.decodeIfPresent(String.self, forKey: .rentCarDetails)
		rentCarsInfo = try values.decodeIfPresent(String.self, forKey: .rentCarsInfo)
		rentCarsLookupData = try values.decodeIfPresent(String.self, forKey: .rentCarsLookupData)
		resource = try values.decodeIfPresent(String.self, forKey: .resource)
		saleCarDetails = try values.decodeIfPresent(String.self, forKey: .saleCarDetails)
		saleCarsInfo = try values.decodeIfPresent(SaleCarsInfo.self, forKey: .saleCarsInfo)
		saleCarsLookupData = try values.decodeIfPresent(String.self, forKey: .saleCarsLookupData)
		showRoomCities = try values.decodeIfPresent(String.self, forKey: .showRoomCities)
		showRoomLocations = try values.decodeIfPresent(String.self, forKey: .showRoomLocations)
		showRooms = try values.decodeIfPresent(String.self, forKey: .showRooms)
		showRoomsRent = try values.decodeIfPresent(String.self, forKey: .showRoomsRent)
		showroomDetails = try values.decodeIfPresent(String.self, forKey: .showroomDetails)
		superAds = try values.decodeIfPresent(String.self, forKey: .superAds)
		superAdsBikes = try values.decodeIfPresent(String.self, forKey: .superAdsBikes)
		superAdsRent = try values.decodeIfPresent(String.self, forKey: .superAdsRent)
		userContacts = try values.decodeIfPresent(String.self, forKey: .userContacts)
		userNotifications = try values.decodeIfPresent(String.self, forKey: .userNotifications)
		userProfile = try values.decodeIfPresent(String.self, forKey: .userProfile)
	}

}
