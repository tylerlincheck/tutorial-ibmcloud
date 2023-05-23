package corp.policies

default passes_validation := false

passes_validation {
  volume_size
  security_policy
  subnet_id
}

volume_size {
  input.tfplan.planned_values.root_module.resources[0].values.size == 40
}

security_policy {
 input.tfplan.planned_values.root_module.resources[2].values.ingress[0].from_port == 22
 input.tfplan.planned_values.root_module.resources[2].values.ingress[0].to_port == 22
}

subnet_id {
  input.tfplan.planned_values.root_module.resources[1].values.subnet_id == "subnet-08f72eee863a99fe7"
}
