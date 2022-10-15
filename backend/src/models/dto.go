package models

type WasteRequest struct {
	Id     int     `json:"id"`
	TPSId  int     `json:"tps_id"`
	Weight float64 `json:"weight"`
}

type WasteResponse struct {
	Id      int    `json:"id"`
	UserId  int    `json:"user_id"`
	Address string `json:"address"`
}

type UserRequest struct {
	Name    string `json:"name"`
	Address string `json:"address"`
}

type WasteTpsResponse struct {
	TpsId   int     `json:"tps_id"`
	Address string  `json:"address"`
	Weight  float64 `json:"weight"`
}

type TPSRequest struct {
	Name    string `json:"name"`
	Address string `json:"address"`
}
