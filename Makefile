.DEFAULT_GOAL := build

testing:
	@echo "Testing back end..."
	@stack test
	@echo "Testing front end..."
	@elm-test
	@echo "Testing UI..."
	@testcafe chrome tests\testsUI.js

build:
	@echo "Building and running Haskell..."
	@stack build
	@echo "Building main.js from Elm files"
	@elm make ./src/Main.elm --output=./views/main.js
	@echo "Building admin.js from Elm files"
	@elm make ./src/Admin.elm --output=./views/admin.js
