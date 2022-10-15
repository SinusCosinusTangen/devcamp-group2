package utils

import (
	"didaur-tokopedia/config"
	"didaur-tokopedia/models"
	"fmt"

	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

var Database *gorm.DB

func InitializeDatabase() {

	fmt.Println("Connecting to database...")

	db, err := gorm.Open(postgres.Open(
		fmt.Sprintf("host=%s port=%d dbname=%s user=%s password=%s sslmode=%s",
			config.AppConfig.DBHost, config.AppConfig.DBPort, config.AppConfig.DBDatabase,
			config.AppConfig.DBUsername, config.AppConfig.DBPassword, config.AppConfig.SSLMode),
	), &gorm.Config{})

	if err != nil {
		panic("[ERROR] Failed to initialize database")
	}

	db.AutoMigrate(
		&models.User{},
		&models.TPS{},
		&models.Vendor{},
		&models.Waste{},
	)

	fmt.Println("Database connected")

	Database = db

}
