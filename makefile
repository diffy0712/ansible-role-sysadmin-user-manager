.PHONY: lint
lint: ## Run yamllint and ansible-lint on all of the files
	make lintf f=./	

.PHONY: lintf
lintf: ## Run yamllint and ansible-lint on a path
	@[ "${f}" ] || ( echo "f is not set. available: ./, tasks/main.yml etc..."; exit 1 )
	yamllint ${f}
	ansible-lint ${f}

.PHONY: lintw
lintw: ## Start watching for file changes and lint them.
	onchange './**/*.yml' -e ./travis.yml -- make lintf f='./{{file}}'
