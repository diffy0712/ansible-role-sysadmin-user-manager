.PHONY: lint
lint: ## Run yamllint and ansible-lint on all of the files
	yamllint ./
	ansible-lint ./