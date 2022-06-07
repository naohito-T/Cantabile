package error

import (
	"errors"
	"fmt"
)

// try がないからどうするか

var ErrNotFound = errors.New("not fund")

type HTTPError struct {
	StatusCode int
	URL        string
}

// 頭文字（URLやID、HTTP、APIのような語）はUrlはIdと試合
func (he *HTTPError) Error() string {
	return fmt.Sprintf("http status code = %d, url = %s", he.StatusCode, he.URL)
}

type loadConfigError struct {
	msg string
	err error
}

// 多くのプログラミング言語で大規模なアプリケーションを実装する場合、エラーコードやマジックナンバー（アプリケーションの挙動をコントローするデータ）を定義する時には列挙型を使用することが多い。
// Goにはenumキーワードなどはないが組み合わせでできる。
