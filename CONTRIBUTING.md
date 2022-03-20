# Contributing

We want this community to be friendly and respectful to each other. Please follow it in all your interactions with the project.

## Development workflow

While developing, you can run molecule tests to test your changes.

To run the tests:

```sh
make test
// or
molecule test
```

All about linters:

```sh
make lint # run linters on all files
make lintf f=tasks/main.yml # run linter on a file
make lintw # watch all files for changes an run lint on change.
```

> __TODO__  
> Our pre-commit hooks verify that the linter and tests pass when committing.   

### Commit message convention

We follow the [conventional commits specification](https://www.conventionalcommits.org/en) for our commit messages:

- `fix`: bug fixes, e.g. fix crash due to deprecated method.
- `feat`: new features, e.g. add new method to the module.
- `refactor`: code refactor, e.g. migrate from class components to hooks.
- `docs`: changes into documentation, e.g. add usage example for the module..
- `test`: adding or updating tests, eg add integration tests using detox.
- `ci`: tooling changes, e.g. change CI config.

Our pre-commit hooks verify that your commit message matches this format when committing.

### Sending a pull request etc...

> TODO