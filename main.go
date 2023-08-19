package main

import (
	"syscall/js"
)

func add(this js.Value, args []js.Value) interface{} {
	result := args[0].Int() + args[1].Int()
	return js.ValueOf(result)
}

func main() {
	c := make(chan struct{}, 0)
	js.Global().Set("addNumbers", js.FuncOf(add))
	js.Global().Set("getCpuCounts", js.FuncOf(GetCpuCountsJs))
	<-c
}

