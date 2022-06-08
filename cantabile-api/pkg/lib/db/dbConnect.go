package db

import (
	"database/sql"
	"fmt"

	_ "github.com/go-sql-driver/mysql"
	"github.com/naohito-T/Cantabile/configs"
)

var Global *sql.DB

// _（アンスコ）で実行される。
func init() {
	driverName := "mysql"
	dataSourceName := fmt.Sprintf(
		"%s:%s@tcp(%s:%d)/%s?parseTime=true",
		configs.DBConfig.DBUser,
		configs.DBConfig.DBPass,
		configs.DBConfig.DBHost,
		configs.DBConfig.DBPort,
		configs.DBConfig.DBName,
	)

	db, err := sql.Open(driverName, dataSourceName)
	// 接続できなかった→フロントでは再度もう一度
	// ここerrorで終了しないようにするか
	if err != nil {
		panic(err)
	}

	Global = db
}
