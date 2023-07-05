# activate armor effects
# @s = arrow shot by player wearing armor
# at @s
# run from armor/modifier/type/archer/find_arrow

tag @s add gm4_ce_archer_arrow
data modify storage gm4_combat_expanded:temp archer_arrow set from entity @s {}
function gm4_combat_expanded:armor/modifier/type/archer/spawn_arrows
data remove storage gm4_combat_expanded:temp archer_arrow
