# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

/*
SUMMARY: Module to deploy Policy Definitions for Azure Policy in the Platforms Management Group
DESCRIPTION: The following components will be options in this deployment
             * Policy Definitions
AUTHOR/S: jspinella
*/

##################################################
### Platforms Policy Definitions Configuations ###
##################################################

##################
# Network
##################

module "mod_platforms_network_configurations_policy_definition" {
  source  = "github.com/POps-Rox/tf-az-overlays-policy//modules/policyDefinition"
  for_each = toset([
    "deny_publicip",
    "deny_mgmt_ports_from_internet",
    "deny_bastion_creation",
    "deny_rdp_from_internet",
    "require_nsg_on_vnet",
  ])
  policy_def_name     = each.value
  policy_category     = "Network"
  management_group_id = data.azurerm_management_group.platforms.id
}
