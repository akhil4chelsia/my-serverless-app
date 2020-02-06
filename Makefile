MICROSERVICE_NAME = my-serverless-app
BUILD_TOOLS_SRC =


venv: lambdas/requirements.txt tests/requirements.txt
	python3 -m venv venv
	. venv/bin/activate; \
	pip install --upgrade pip==18.1; \
	pip install --upgrade $(BUILD_TOOLS_SRC); \
	bash install_requirements.sh "service/my-serverless-app/"
	touch venv  # to have newer venv and avoid unnecessary repeating this command

.PHONY: help
help: _help
	@:

.PHONY: package
package: _package
	@:

.PHONY: test
test: terraform_validate lint_state_machines python_tests
	@:

.PHONY: terraform_validate
terraform_validate: _terraform_validate
	@:

.PHONY: lint_state_machines
lint_state_machines: _lint_state_machines
	@:

.PHONY: python_tests
python_tests: _python_tests
	@:

.PHONY: clean
clean: _clean
	@:

.PHONY: distclean
distclean: _distclean
	@:

-include venv/make/*.mk
