package service

import (
	"didaur-tokopedia/models"
	"didaur-tokopedia/utils"
	"time"
)

func CreateTps(tpsRequest models.TPSRequest) (models.TPS, error) {
	db := utils.Database

	tps := models.TPS{
		Name:      tpsRequest.Name,
		Address:   tpsRequest.Address,
		CreatedAt: time.Now(),
		UpdatedAt: time.Now(),
	}

	db.Create(&tps)

	return tps, nil
}

func CreateWasteRequest(id int) (models.Waste, error) {
	db := utils.Database

	waste := models.Waste{
		UserId:     id,
		IsConfimed: false,
		CreatedAt:  time.Now(),
		UpdatedAt:  time.Now(),
	}

	db.Create(&waste)

	return waste, nil
}

func GetAllWaste() ([]models.WasteResponse, error) {
	db := utils.Database

	var waste []models.Waste
	var wasteResponse []models.WasteResponse

	db.Find(&waste, "is_confimed = ?", false)

	for _, w := range waste {
		var user models.User
		db.First(&user, w.UserId)
		wasteResponse = append(wasteResponse, models.WasteResponse{
			Id:      int(w.ID),
			UserId:  w.UserId,
			Address: user.Address,
		})
	}

	return wasteResponse, nil
}

func UpdateWasteStatus(wasteRequest models.WasteRequest) (models.Waste, error) {
	db := utils.Database

	var waste models.Waste

	db.First(&waste, wasteRequest.Id)
	waste.TPSId = wasteRequest.TPSId
	waste.IsConfimed = true
	waste.Weight = wasteRequest.Weight
	waste.UpdatedAt = time.Now()
	db.Save(&waste)

	UpdateExpAndCoins(int(waste.ID), waste.UserId, waste.Weight)
	UpdateTpsWeight(waste.TPSId, waste.Weight)

	return waste, nil
}

func UpdateTpsWeight(id int, weight float64) (models.TPS, error) {
	db := utils.Database

	var tps models.TPS

	db.First(&tps, id)
	tps.Weight += weight
	tps.UpdatedAt = time.Now()
	db.Save(&tps)

	return tps, nil
}

func GetTPS(id int) (models.TPS, error) {
	db := utils.Database

	var tps models.TPS

	db.First(&tps, id)

	return tps, nil
}

func GetAllReadyTPS() ([]models.WasteTpsResponse, error) {
	db := utils.Database

	var tps []models.TPS
	var wasteTpsResponse []models.WasteTpsResponse

	db.Find(&tps, "is_ready = ?", true)

	for _, t := range tps {
		wasteTpsResponse = append(wasteTpsResponse, models.WasteTpsResponse{
			TpsId:   int(t.ID),
			Address: t.Address,
			Weight:  t.Weight,
		})
	}

	return wasteTpsResponse, nil
}

func SetTpsReady(id int) (models.TPS, error) {
	db := utils.Database

	var tps models.TPS

	db.First(&tps, id)
	tps.IsReady = true
	tps.UpdatedAt = time.Now()
	db.Save(&tps)

	return tps, nil
}

func SetTpsUnready(id int, weight float64) (models.TPS, error) {
	db := utils.Database

	var tps models.TPS

	db.First(&tps, id)
	tps.IsReady = false
	tps.Weight -= weight
	tps.UpdatedAt = time.Now()
	db.Save(&tps)

	return tps, nil
}
