# set sword stats when player is sneaking
# @s = player wearing armor
# at unspecified
# run from armor/modifier/type/sword_ring/prep

data modify storage gm4_combat_expanded:temp sword_ring.scale set value 1.0
data modify storage gm4_combat_expanded:temp sword_ring.height set value 0.65
data modify storage gm4_combat_expanded:temp sword_ring.offset set value 2.625

scoreboard players set $stats_set gm4_ce_data 1
scoreboard players add @s gm4_ce_sword_ring.deg 4
