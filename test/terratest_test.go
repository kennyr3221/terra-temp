package test

import (
	"testing"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestTerraformIaacSample1(t *testing.T) {
	t.Parallel()

	// Ensure the TerraformDir points to the correct directory with your Terraform configuration files
	terraformOptions := &terraform.Options{
		TerraformDir: "../", // Adjust this path to the directory where your Terraform configuration is located

		Vars: map[string]interface{}{
			"global_settings":         map[string]interface{}{},
			"resource_group_location": "East US",
			"resource_group_name":     "example-resources",
		},
	}

	// Run terraform init and apply. Fail the test if there are any errors.
	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)

	// Validate the resource group name and location
	resourceGroupName := terraform.Output(t, terraformOptions, "resource_group_name")
	resourceGroupLocation := terraform.Output(t, terraformOptions, "resource_group_location")

	assert.Equal(t, "example-resources", resourceGroupName)
	assert.Equal(t, "East US", resourceGroupLocation)
}
