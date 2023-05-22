package corp.policies

default passes_validation := true

#passes_validation := true {
  #volume_size
  #security_policy
  #subnet_id
#}

volume_size := true {
    input.tfplan.planned_values.root_module.resources[0].values.size == 40
}

security_policy := true {
    input.tfplan.planned_values.root_module.resources[2].values.ingress[0].from_port == 22
    input.tfplan.planned_values.root_module.resources[2].values.ingress[0].to_port == 22
}

subnet_id := true {
    input.tfplan.planned_values.root_module.resources[1].values.subnet_id == "subnet-08f72eee863a99fe7"
}
