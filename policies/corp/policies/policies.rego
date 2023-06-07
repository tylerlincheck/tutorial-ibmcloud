package corp.policies

default passes_validation := false

passes_validation {
  volume_size
  security_policy
  subnet_id
}

volume_size {
  volumes := resources["aws_ebs_volume"]
  some index
  volumes[index].values.size == 40
}

security_policy {
security := resources["aws_security_group"]
some index
security[index].values.ingress[0].from_port == 22
security[index].values.ingress[0].to_port == 22
}

subnet_id {
 subnet := resources["aws_instance"]
 some index
 subnet[index].values.subnet_id == "subnet-08f72eee863a99fe7"
}
