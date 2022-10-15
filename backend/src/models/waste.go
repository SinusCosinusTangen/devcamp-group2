package models

import "time"

type Waste struct {
	ID         uint      `gorm:"primaryKey" json:"id"`
	UserId     int       `json:"user_id"`
	TPSId      int       `json:"tps_id"`
	IsConfimed bool      `json:"is_confirmed"`
	Weight     float64   `json:"weight"`
	CreatedAt  time.Time `json:"created_at"`
	UpdatedAt  time.Time `json:"updated_at"`
}
