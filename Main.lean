import Koch.Generator

-- TODO get as a command-line argument
def depth : Nat := 3

def parGolf : Nat := 5 ^ depth

def parMarble : Nat := 2 * parGolf

-- TODO the ball and the hole must be placed by hand in the level editor
def header : List String := [
  "#Name Koch " ++ depth.repr,
  "#Theme Space4D",
  "#Par " ++ parGolf.repr,
  "#ParTime " ++ parMarble.repr,
  "#Day 1",
  "#Music Standard"]

def Tile.print : Tile → String
| Forward => "Straight4"
| Turn => "Turn4"
| Opposite => "Turn4,2"
| Start => "Start4"
| End => "EndContinue4"

def content : List String := header ++ (track depth).map Tile.print

-- TODO save to C:\Users\[username]\AppData\LocalLow\CodeParade\4D Golf\CustomLevels
def main : IO Unit :=
  IO.FS.writeFile ⟨"koch" ++ depth.repr ++ ".4dg"⟩ ("\n".intercalate content)
