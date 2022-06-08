package configs

import (
	"github.com/kelseyhightower/envconfig"
)

var Global Configs
var DBConfig DBConfigs

type AppConfigs struct{}

type DBConfigs struct {
	DBHost string `envconfig:"DB_HOST"`
	DBPort int    `envconfig:"DB_PORT"`
	DBUser string `envconfig:"DB_USER"`
	DBPass string `envconfig:"DB_PASS"`
	DBName string `envconfig:"DB_NAME"`
}

type Configs struct {
	Command string `envconfig:"COMMAND"`
	DBHost  string `envconfig:"DB_HOST"`
	DBPort  int    `envconfig:"DB_PORT"`
	DBUser  string `envconfig:"DB_USER"`
	DBPass  string `envconfig:"DB_PASS"`
	DBName  string `envconfig:"DB_NAME"`
}

// エラーの変数名、つまりErrorインターフェースを満たす
// Errorがとして振る舞う型の名前は接尾語Errorをつけるのが慣例
// 同様にエラーの変数は接頭辞Err またはerrから始まる
type StatusCodeError struct {
	errStatusCode string
	errMessage    string
}

// ↑を呼び出すときにconfigs.StatusCodeErrorとなる。

func init() {
	envconfig.MustProcess("", &Global)
	envconfig.MustProcess("", &DBConfig)
}


func env() {
	switch (envconfig.) {
	case 'local':
	  return Environment.Local;
	case 'development':
	  return Environment.Develpoment;
	case 'staging':
	  return Environment.Staging;
	case 'production':
	  return Environment.Production;
	case 'job':
	  return Environment.Job;
	case 'test':
	  return Environment.Test;
	default:
	  return Environment.None;
  }	
}
