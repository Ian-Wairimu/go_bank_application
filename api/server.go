package api

import (
	"github.com/gin-gonic/gin"
	db "github.com/wairimu-ian/simplebank/db/sqlc"
)

// Server will serve all http request for our banking service.
type Server struct {
	store  *db.Store
	router *gin.Engine
}
