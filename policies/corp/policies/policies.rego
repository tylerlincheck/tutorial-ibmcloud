package corp.policies

default passes_validation := false

passes_validation := true {
    input.volume_size == 40
}
