.PHONY:	all
all:	clean	\
	build


.PHONY:	clean
clean:


.PHONY:	build
build:
	cp '/usr/share/go-1.18/misc/wasm/wasm_exec.js' 'wasm_exec.js'
	GOOS=js GOARCH=wasm go build -o 'main.wasm' 'main.go'


.PHONY:	test
test:
	python3 -m http.server 8000

