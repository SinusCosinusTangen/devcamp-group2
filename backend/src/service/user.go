package service

import (
	"didaur-tokopedia/models"
	"didaur-tokopedia/utils"
	"math"
	"time"
)

func CreateUser(userRequest models.UserRequest) (models.User, error) {
	db := utils.Database

	user := models.User{
		Name:      userRequest.Name,
		Address:   userRequest.Address,
		Coins:     0,
		Exp:       0,
		CreatedAt: time.Now(),
		UpdatedAt: time.Now(),
	}

	db.Create(&user)

	return user, nil
}

func GetUserById(id int) (models.User, error) {
	db := utils.Database

	var user models.User

	db.First(&user, id)

	return user, nil
}

func UpdateExpAndCoins(id int, userId int, weight float64) (models.User, error) {
	db := utils.Database

	var user models.User

	exp := weight * 1.5
	coins := int(math.Floor(weight * 200))

	db.First(&user, userId)
	user.Exp += exp
	user.Coins += coins
	user.UpdatedAt = time.Now()
	db.Save(&user)

	return user, nil
}
