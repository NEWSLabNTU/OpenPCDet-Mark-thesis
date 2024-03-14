.PHONY: default prepare build clean

default:
	@echo 'Usage:'
	@echo '    make prepare'
	@echo '    make build'
	@echo '    make clean'

prepare:
	curl -sSL https://install.python-poetry.org | python3 -

build:
	poetry lock
	poetry install
	poetry run python setup.py develop
	poetry build

clean:
	rm -f ./poetry.lock
	poetry env list | cut -f1 -d' ' | while read name; do \
		poetry env remove "$$name"; \
	done
