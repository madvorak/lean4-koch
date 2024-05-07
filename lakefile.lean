import Lake
open Lake DSL

package Koch {
}

lean_lib Koch {
}

@[default_target]
lean_exe koch where
  root := `Main
