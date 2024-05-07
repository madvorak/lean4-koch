
def n_times {T : Type} (f : T → T) (a : T) : Nat → T
| 0   => a
| n+1 => n_times f (f a) n
