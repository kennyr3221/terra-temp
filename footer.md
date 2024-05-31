## Contributing

1. Setup your environment
    1. Install [Terraform](https://www.terraform.io/downloads.html)
    2. Install [Python 3.x](https://www.python.org/downloads/)
    3. Install Pre-Commit Hook Dependencies

        ```bash
        pip install pre-commit -q
        pip3 install checkov -q
        ```

    4. Install [Chocolatey](https://chocolatey.org/install)
    5. Install Terraform, Tflint, Terraform-docs, and jq

        ```powershell
        choco install -y terraform tflint terraform-docs jq
        ```

2. Clone the repo
3. Setup pre-commit hooks

```bash
pre-commit install-hooks
pre-commit install
```

4. Write Terraform code in a new branch
5. Create a pull request for the main branch.
6. Merge pull request after approval.
