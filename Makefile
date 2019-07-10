.DEFAULT_GOAL := build

build:
	@echo "Building and running Haskell..."
	@stack build
	@echo "Building main.js from Elm files"
	@elm make ./src/Main.elm --output=./views/main.js
