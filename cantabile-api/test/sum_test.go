package test

import "testing"

func TestA(t *testing.T) {
	var nums []int = []int{1, 2, 3, 4, 5}
	if !(Summarize(nums) == 15) {
		t.Error(`miss`)
	}
}

func TestB(t *testing.T) {
	var nums []int = []int{1, 2, 3, 4, 5, 6}
	if !(Summarize(nums) == 20) {
		t.Error(`6 miss`)
	}
}
