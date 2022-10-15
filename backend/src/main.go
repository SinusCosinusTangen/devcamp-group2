package main

import (
	"didaur-tokopedia/config"
	"didaur-tokopedia/router"
	"didaur-tokopedia/utils"
	"fmt"
	"net/http"
	"time"

	"github.com/gin-gonic/gin"
)

func main() {
	config.InitializeConfig()
	utils.InitializeDatabase()

	if config.AppConfig.Debug {
		gin.SetMode(gin.ReleaseMode)
	}

	s := &http.Server{
		Addr:           fmt.Sprintf(":%d", config.AppConfig.Port),
		Handler:        router.InitializeRouter(),
		ReadTimeout:    10 * time.Second,
		WriteTimeout:   10 * time.Second,
		MaxHeaderBytes: 1 << 20,
	}
	if err := s.ListenAndServe(); err != nil {
		panic("[ERROR] Failed to listen and serve")
	}
}
