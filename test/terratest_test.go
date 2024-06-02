package test

import (
	"testing"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestTerraformIaacSample1(t *testing.T) {
	t.Parallel()

	terraformOptions := &terraform.Options{
		// The path to where your Terraform code is located
		TerraformDir: "../",

		// Variables to pass to our Terraform code using -var options
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
	resourceGroup := terraform.Output(t, terraformOptions, "azurerm_resource_group_this")
	assert.Equal(t, "example-resources", resourceGroup["name"])
	assert.Equal(t, "East US", resourceGroup["location"])
}
