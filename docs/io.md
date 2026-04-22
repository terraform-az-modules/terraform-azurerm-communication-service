## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| custom\_name | Override default naming convention | `string` | `null` | no |
| deployment\_mode | Specifies how the infrastructure/resource is deployed | `string` | `"terraform"` | no |
| domain\_management | n/a | `string` | `"AzureManaged"` | no |
| enable | Flag to control the module creation | `bool` | `true` | no |
| enable\_domain | Flag to create service domain. | `bool` | `true` | no |
| environment | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `null` | no |
| extra\_tags | Variable to pass extra tags. | `map(string)` | `null` | no |
| label\_order | The order of labels used to construct resource names or tags. If not specified, defaults to ['name', 'environment', 'location']. | `list(string)` | <pre>[<br>  "name",<br>  "environment",<br>  "location"<br>]</pre> | no |
| location | The location/region where the virtual network is created. Changing this forces a new resource to be created. | `string` | `null` | no |
| managedby | ManagedBy, eg 'terraform-az-modules'. | `string` | `"terraform-az-modules"` | no |
| name | Name  (e.g. `app` or `cluster`). | `string` | `null` | no |
| repository | Terraform current module repo | `string` | `"https://github.com/terraform-az-modules/terraform-azure-vnet"` | no |
| resource\_group\_name | The name of the resource group in which to create the virtual network. Changing this forces a new resource to be created. | `string` | `null` | no |
| resource\_position\_prefix | Controls the placement of the resource type keyword (e.g., "vnet", "ddospp") in the resource name.<br><br>- If true, the keyword is prepended: "vnet-core-dev".<br>- If false, the keyword is appended: "core-dev-vnet".<br><br>This helps maintain naming consistency based on organizational preferences. | `bool` | `true` | no |
| user\_engagement\_tracking\_enabled | Describes user engagement tracking is enabled or disabled. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| communication\_service\_id | The ID of the Azure Communication Service resource. |
| primary\_connection\_string | The primary connection string used to access the Azure Communication Service. |
| primary\_key | The primary access key for the Azure Communication Service. |
| secondary\_connection\_string | The secondary connection string used to access the Azure Communication Service. |
| secondary\_key | The secondary access key for the Azure Communication Service. |

