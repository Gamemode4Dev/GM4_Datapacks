# activate armor effects
# @s = arrow shot by player wearing armor
# at unspecified
# run from tick

tag @s add gm4_ce_archer_arrow
data modify storage gm4_combat_expanded:temp archer_arrow set from entity @s {}

execute positioned ^ ^ ^ summon arrow run function gm4_combat_expanded:armor/modifier/type/archer/storm_arrow
execute positioned ^ ^ ^ summon arrow run function gm4_combat_expanded:armor/modifier/type/archer/storm_arrow
execute positioned ^ ^ ^ summon arrow run function gm4_combat_expanded:armor/modifier/type/archer/storm_arrow
execute positioned ^ ^ ^ summon arrow run function gm4_combat_expanded:armor/modifier/type/archer/storm_arrow
execute positioned ^ ^ ^ summon arrow run function gm4_combat_expanded:armor/modifier/type/archer/storm_arrow
execute positioned ^ ^ ^ summon arrow run function gm4_combat_expanded:armor/modifier/type/archer/storm_arrow
execute positioned ^ ^ ^ summon arrow run function gm4_combat_expanded:armor/modifier/type/archer/storm_arrow
execute positioned ^ ^ ^ summon arrow run function gm4_combat_expanded:armor/modifier/type/archer/storm_arrow

data remove storage gm4_combat_expanded:temp archer_arrow
