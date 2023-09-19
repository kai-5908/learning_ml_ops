.PHONY: lint
lint:
	poetry run isort . --check-only
	poetry run black . --check
	poetry run mypy .

.PHONY: test
test:
	poetry run pytest tests -n auto

.PHONY: test-cov
test-cov:
	poetry run pytest tests \
		-n auto \
		--cov src \
		--cov-branch \
		--junitxml pytest.xml \
		--cov-report term-missing:skip-covered | tee pytest-coverage.txt
