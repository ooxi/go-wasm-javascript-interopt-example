.PHONY:	all
all:	clean	\
	build


.PHONY:	clean
clean:
	@if [ -f 'go.sum' ]; then	\
		rm 'go.sum';		\
	fi

	@if [ -f 'main.wasm' ]; then	\
		rm 'main.wasm';		\
	fi

	@if [ -f 'wasm_exec.js' ]; then	\
		rm 'wasm_exec.js';	\
	fi


.PHONY:	build
build:
	cp '/usr/share/go-1.18/misc/wasm/wasm_exec.js' 'wasm_exec.js'
	go get
	GOOS=js GOARCH=wasm go build -o 'main.wasm'


.PHONY:	test
test:
	python3 -m http.server 8000

