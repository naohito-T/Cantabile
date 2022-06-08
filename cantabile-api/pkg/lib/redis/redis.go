package redis

import (
	"github.com/gomodule/redigo/redis"
)

var Redis redis.Conn

/*
 * @desc 理想
 * initで初期化 & 接続、接続側でkeyを使用し利用する。
 */
func init() {
	conn, err := redis.Dial("tcp", "redis:6379")
	if err != nil {
		panic(err)
	}

	Redis = conn
}
