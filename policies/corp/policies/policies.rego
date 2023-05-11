package corp.policies

default passes_validation := false

passes_validation := true {
    input.volumes[i].size == 50
}
