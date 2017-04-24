package main

import (
	"fmt"
	"net/http"

	"github.com/gin-gonic/gin"
)

/* Should be passed by -ldflags*/
var version string

func main() {
	fmt.Printf("Starting Concourse GO app example version %s\n", version)
	r := gin.Default()
	r.GET("/", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"message": "HelloWorld!",
		})
	})
	r.GET("/ping", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"message": "pong",
		})
	})
	r.GET("/status", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"message": "running",
		})
	})
	r.Run()
}
