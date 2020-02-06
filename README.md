# my-serverless-app

first serverless app skeleton

### Prerequistes

- Python 3.6

### Running

`make help` - print help

Commands:
- package - creates deployment package
- test - run tests
- python_tests - run python tests
- clean - clean files created by build

### Project structure

- `infra` - Terraform files deploying infrastructure
- `jenkins` - Jenkins common variables and tags
- `lambdas` - Directory with Python packages holding Lambda handlers.
- `service` - Implementation of a service. Used by Lambdas.
- `tests` - Python tests for service code and Lambdas code.
- `scripts` - Scripts used by `make`
