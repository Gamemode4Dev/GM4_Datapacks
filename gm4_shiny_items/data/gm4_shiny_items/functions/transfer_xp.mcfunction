# Run from as_gm4_can_be_absorbed
# @s = All items with the tag "as_gm4_can_be_absorbed"


# This is how many XP Orbs get transfered per 16 ticks (8)
execute if score @s gm4_xporb_xp matches 4.. run scoreboard players add @e[tag=gm4_can_become_shiny,limit=1,sort=nearest] gm4_absorbed_xp 4
execute if score @s gm4_xporb_xp matches 4.. run scoreboard players remove @s gm4_xporb_xp 4
execute if score @s gm4_xporb_xp matches 2.. run scoreboard players add @e[tag=gm4_can_become_shiny,limit=1,sort=nearest] gm4_absorbed_xp 2
execute if score @s gm4_xporb_xp matches 2.. run scoreboard players remove @s gm4_xporb_xp 2
execute if score @s gm4_xporb_xp matches 1.. run scoreboard players add @e[tag=gm4_can_become_shiny,limit=1,sort=nearest] gm4_absorbed_xp 1
execute if score @s gm4_xporb_xp matches 1.. run scoreboard players remove @s gm4_xporb_xp 1
execute if score @s gm4_xporb_xp matches 1.. run scoreboard players add @e[tag=gm4_can_become_shiny,limit=1,sort=nearest] gm4_absorbed_xp 1
execute if score @s gm4_xporb_xp matches 1.. run scoreboard players remove @s gm4_xporb_xp 1