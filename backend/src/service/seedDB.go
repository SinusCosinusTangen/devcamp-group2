package service

import (
	"didaur-tokopedia/models"
	"didaur-tokopedia/utils"
	"time"
)

func SeedDB() {
	user := models.User{
		Name:      "John Lennon",
		Address:   "Jl. Kebon Jeruk Raya No. 1",
		Coins:     0,
		Exp:       0,
		CreatedAt: time.Now(),
		UpdatedAt: time.Now(),
	}

	vendor := models.Vendor{
		Name:      "Vendor 1",
		Address:   "Jl. Kebon Jeruk Raya No. 2",
		CreatedAt: time.Now(),
		UpdatedAt: time.Now(),
	}

	tps := models.TPS{
		Name:      "TPS 1",
		Address:   "Jl. Kebon Jeruk Raya No. 3",
		IsReady:   false,
		Weight:    0,
		CreatedAt: time.Now(),
		UpdatedAt: time.Now(),
	}

	waste := models.Waste{
		UserId:     1,
		IsConfimed: false,
		Weight:     0,
		CreatedAt:  time.Now(),
		UpdatedAt:  time.Now(),
	}

	db := utils.Database

	db.Create(&user)
	db.Create(&vendor)
	db.Create(&tps)
	db.Create(&waste)
}
