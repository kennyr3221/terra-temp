 - name: Set up Go module
   run: |
     go mod init terratest-example || true
     go mod tidy
