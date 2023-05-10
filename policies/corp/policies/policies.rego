package example

default allow := true

allow := false {
    count(violation) > 0
}

violation[0] {
    volume_size
}

volume_size {
    input.volumes[i].size == 50
}
