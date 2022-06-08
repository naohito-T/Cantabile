package seeds

import (
	"time"

	"github.com/gorm"
)

type User struct {
	id        int
	createdAt time.Time
	updatedAt time.Time
}

func seeds(db *gorm.DB)
