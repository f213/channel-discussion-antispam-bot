install-dev-deps: dev-deps
	pip-sync requirements.txt dev-requirements.txt

install-deps: deps
	pip-sync requirements.txt

deps:
	pip-compile requirements.in

dev-deps: deps
	pip-compile dev-requirements.in

lint:
	flake8 *.py
	mypy

dev:
	watchmedo auto-restart --patterns '*.py' python bot.py
