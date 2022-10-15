package controller

import (
	"didaur-tokopedia/models"
	"didaur-tokopedia/service"
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"
)

func CreateUser(c *gin.Context) {

	var input models.UserRequest
	if err := c.ShouldBindJSON(&input); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	service.CreateUser(input)
}

func GetUserById(c *gin.Context) {

	sid := c.Param("id")
	id, err := strconv.Atoi(sid)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	user, err := service.GetUserById(id)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusOK, user)
}

func Recycle(c *gin.Context) {

	sid := c.Param("id")
	id, err := strconv.Atoi(sid)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	user, err := service.CreateWasteRequest(id)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusOK, user)
}

func GetAllWaste(c *gin.Context) {

	waste, err := service.GetAllWaste()
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusOK, gin.H{"result": waste})
}

func ConfirmWaste(c *gin.Context) {

	var input models.WasteRequest
	if err := c.ShouldBindJSON(&input); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	user, err := service.UpdateWasteStatus(input)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusOK, user)
}

func GetTps(c *gin.Context) {

	sid := c.Param("id")
	id, err := strconv.Atoi(sid)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	tps, err := service.GetTPS(id)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusOK, tps)
}

func CreateTps(c *gin.Context) {

	var input models.TPSRequest
	if err := c.ShouldBindJSON(&input); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	tps, err := service.CreateTps(input)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusOK, tps)
}

func GetAllReadyTps(c *gin.Context) {

	tps, err := service.GetAllReadyTPS()
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusOK, gin.H{"result": tps})
}

func SetTpsReady(c *gin.Context) {

	sid := c.Param("id")
	id, err := strconv.Atoi(sid)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	tps, err := service.SetTpsReady(id)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusOK, tps)
}
