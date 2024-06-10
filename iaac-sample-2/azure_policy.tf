resource "azurerm_policy_assignment" "policy_assignment" {
  name                 = "policy_assignment"
  scope                = azurerm_resource_group.project1_rg.id
  policy_definition_id = azurerm_policy_definition.project1_rg.id

  parameters = <<PARAMETERS
    {
      "tagName": {
        "value": "environment"
        {
      "tagName": {
        "value": "testing"
      },
      "tagValue": {
        "value": "production"
      }
    }
  PARAMETERS

  tags = local.tags
}
