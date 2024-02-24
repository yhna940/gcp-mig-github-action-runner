package test

import (
	"github.com/gruntwork-io/terratest/modules/terraform"
	"testing"
)

func TestRunnerMigModule(t *testing.T) {

	terraformOptions := &terraform.Options{
		TerraformDir: "../",
		VarFiles:     []string{"terraform.tfvars"},
	}

	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)
}
