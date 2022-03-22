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
	onchange './**/*.yml' -e ./gitlab-ci.yml -- make lintf f='./{{file}}'

.PHONY: test
test: ## Run molecule tests
	molecule test

.PHONY: hooks
hooks: ## Copy git hooks (might need sudo to copy to .git/hooks)
	npm install -g @commitlint/{config-conventional,cli}
	cp bin/hooks/commit-msg.sh .git/hooks/commit-msg
	chmod +x .git/hooks/commit-msg

 