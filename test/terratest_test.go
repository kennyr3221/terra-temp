package test

import (
    "testing"
    "github.com/gruntwork-io/terratest/modules/terraform"
    "github.com/stretchr/testify/assert"
)

func TestTerraformIaacSample1(t *testing.T) {
    terraformOptions := &terraform.Options{
        TerraformDir: "../iaac-sample-1",
        Vars: map[string]interface{}{
            "example": "test1",
        },
    }

    defer terraform.Destroy(t, terraformOptions)
    terraform.InitAndApply(t, terraformOptions)

    output := terraform.Output(t, terraformOptions, "example_output")
    assert.Equal(t, "expected_output1", output)
}

func TestTerraformIaacSample2(t *testing.T) {
    terraformOptions := &terraform.Options{
        TerraformDir: "../iaac-sample-2",
        Vars: map[string]interface{}{
            "example": "test2",
        },
    }

    defer terraform.Destroy(t, terraformOptions)
    terraform.InitAndApply(t, terraformOptions)

    output := terraform.Output(t, terraformOptions, "example_output")
    assert.Equal(t, "expected_output2", output)
}
