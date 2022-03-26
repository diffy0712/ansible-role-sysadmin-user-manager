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
test: ## Run molecule tests on default platform
	molecule test

.PHONY: testall
testall: ## Run test on multiple platforms
	MOLECULE_DISTRO=rockylinux8 molecule test
	MOLECULE_DISTRO=ubuntu1804 molecule test
	MOLECULE_DISTRO=ubuntu2004 molecule test
	MOLECULE_DISTRO=debian10 molecule test
	MOLECULE_DISTRO=debian11 molecule test
	MOLECULE_DISTRO=centos7 molecule test

.PHONY: hooks
hooks: ## Copy git hooks (might need sudo to copy to .git/hooks)
	npm install -g @commitlint/{config-conventional,cli}
	cp bin/hooks/commit-msg.sh .git/hooks/commit-msg
	chmod +x .git/hooks/commit-msg

 