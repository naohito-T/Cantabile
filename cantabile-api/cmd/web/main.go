package main

// https://sourjp.github.io/posts/go-import/

import ( // "github.com/gomodule/redigo/redis"
	// _ "github.com/naohito-T/cantabile-api/configs"
	// _ "github.com/naohito-T/Cantabile/pkg/lib/redis"
	"github.com/naohito-T/Cantabile/internal/web/router"
)

// redisを分ける
// middlewareをかける
// localならseedをかける。
// routerに分ける
//
func main() {
	// envはlocalで、なおかつredisが設定されていない場合はseedを放つ
	// loginを確認し
	router.HomeRouter()
	// login後
}
