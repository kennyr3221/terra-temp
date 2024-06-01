name: Terraform and Terratest

on:
  push:
    branches:
      - main
      - features
      - develop
      - test
  pull_request:
    branches:
      - main
      - features
      - develop
      - test

jobs:
  test:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        go-version: ["1.17", "1.18"]
    steps:
    - uses: actions/checkout@v4

    - name: Set up Go ${{ matrix.go-version }}
      uses: actions/setup-go@v3
      with:
        go-version: ${{ matrix.go-version }}

    - name: Install Terraform
      run: |
        sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
        curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
        sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
        sudo apt-get update && sudo apt-get install terraform

    - name: Set up Go module
      run: |
        go mod init terratest-example || true
        go mod tidy

    - name: Install Go and Terratest dependencies
      run: |
        go install github.com/gruntwork-io/terratest/modules/terraform@latest
        go install github.com/stretchr/testify/assert@latest

    - name: Run Terratest
      run: |
        cd test
        go test -v

    - name: Terraform Init
      run: terraform init
      working-directory: ./terraform

    - name: Terraform Apply
      run: terraform apply -auto-approve
      working-directory: ./terraform

    - name: Terraform Destroy
      run: terraform destroy -auto-approve
      working-directory: ./terraform
