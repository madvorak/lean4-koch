import Koch.Utils

private inductive Move
| Forward
| Left
| Right
| Pad

private abbrev F := Move.Forward
private abbrev L := Move.Left
private abbrev R := Move.Right
private abbrev P := Move.Pad

private def init : List Move := [F]

private def gen : Move → List Move
| .Forward => [F, P, L, P, F, R, P, F, P, R, F, P, L, P, F]
| .Left => [L]
| .Right => [R]
| .Pad => [P]

private def fractal : List Move → List Move := List.join ∘ List.map gen

inductive Tile
| Forward
| Turn
| Opposite
| Start
| End

private def toTiles (flip : Bool) : List Move → List Tile
| [] => []
| Move.Forward :: tail => Tile.Forward :: toTiles flip tail
| Move.Left :: tail => (if flip then Tile.Opposite else Tile.Turn) :: toTiles false tail
| Move.Right :: tail => (if flip then Tile.Turn else Tile.Opposite) :: toTiles true tail
| Move.Pad :: tail => Tile.Forward :: Tile.Forward :: toTiles flip tail

def track (iterations : Nat) : List Tile :=
  [Tile.Start] ++ toTiles false (n_times fractal init iterations) ++ [Tile.End]
