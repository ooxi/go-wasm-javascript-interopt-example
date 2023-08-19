package main

import (
	"github.com/shirou/gopsutil/cpu"
	"syscall/js"
)

func GetCpuCounts() (int, error) {
	return cpu.Counts(true)
}

func GetCpuCountsJs(this js.Value, args []js.Value) interface{} {
	result, err := GetCpuCounts()

	if nil != err {
		return js.ValueOf(err)
	}

	return js.ValueOf(result)
}

