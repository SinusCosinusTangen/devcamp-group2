package service

import (
	"didaur-tokopedia/models"
	"didaur-tokopedia/utils"
	"time"
)

func GetVendorById(id int) (models.Vendor, error) {
	db := utils.Database

	var vendor models.Vendor

	db.First(&vendor, id)

	return vendor, nil
}

func CreateVendor(vendorRequest models.VendorRequest) (models.Vendor, error) {
	db := utils.Database

	vendor := models.Vendor{
		Name:      vendorRequest.Name,
		Address:   vendorRequest.Address,
		CreatedAt: time.Now(),
		UpdatedAt: time.Now(),
	}

	db.Create(&vendor)

	return vendor, nil
}

func ProcessWaste(input models.BuyWasteRequest) {

	tpsId := input.TpsId
	weight := input.Weight

	SetTpsUnready(tpsId, weight)
}
