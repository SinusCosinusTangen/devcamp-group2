package router

import (
	"didaur-tokopedia/controller"

	"github.com/gin-gonic/gin"
)

func InitializeRouter() (router *gin.Engine) {
	router = gin.Default()

	defaultRoute := router.Group("")
	{
		defaultRoute.GET("/", controller.Index)
	}

	apiRoute := router.Group("/api")
	{
		apiRoute.POST("/user", controller.CreateUser)
		apiRoute.GET("/user/:id", controller.GetUserById)
		apiRoute.GET("/recycle/:id", controller.Recycle)
		apiRoute.GET("/waste", controller.GetAllWaste)
		apiRoute.POST("/confirm", controller.ConfirmWaste)
		apiRoute.GET("/tps/:id", controller.GetTps)
		apiRoute.POST("/tps", controller.CreateTps)
		apiRoute.GET("/ready/:id", controller.SetTpsReady)
		apiRoute.GET("/ready-waste", controller.GetAllReadyTps)
		apiRoute.POST("/buy-waste", controller.BuyWaste)
		apiRoute.GET("/vendor/:id", controller.GetVendor)
		apiRoute.POST("/vendor", controller.CreateVendor)
		apiRoute.GET("/seed-db", controller.SeedDB)
	}

	return router
}
