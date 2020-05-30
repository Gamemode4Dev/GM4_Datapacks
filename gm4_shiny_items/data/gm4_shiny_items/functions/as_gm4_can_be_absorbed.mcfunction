# Run from main
# @s = All items with the tag "gm4_can_be_absorbed"

# Condition for item to loose tag "gm4_can_become_shiny"
execute unless entity @e[tag=gm4_can_become_shiny,distance=..2] run tag @s remove gm4_can_be_absorbed

# Moves XP Orb closer to item
execute facing entity @e[tag=gm4_can_become_shiny,sort=nearest,limit=1,distance=1..3] feet run tp ^ ^ ^1

# Store XP Orb value in scoreboard
execute store result score @s gm4_xporb_xp run data get entity @s Value 1

# Show Particles & Play Sounds
execute if score @s gm4_xporb_xp matches 1.. run particle dust 1.000 0.031 0.000 1 ~ ~.2 ~ .05 .05 .05 .1 1 
execute if score @s gm4_xporb_xp matches 1.. at @e[tag=gm4_can_become_shiny,limit=1,sort=nearest] run particle minecraft:enchant ~ ~.4 ~ .2 .2 .2 .01 3
execute if score @s gm4_xporb_xp matches ..0 run particle dust 1.000 0.031 0.000 1 ~ ~.3 ~ .1 .1 .1 .1 5 
execute as @e[tag=gm4_can_become_shiny,distance=..2] at @s run function gm4_shiny_items:play_pufferfish_sound

# Transfer XP from Orb to Item
function gm4_shiny_items:transfer_xp

# Store amount from scoreboard into XP Orb
execute store result entity @s Value short 1 run scoreboard players get @s gm4_xporb_xp

# Kill XP Orb with no XP value
execute if entity @s[scores={gm4_xporb_xp=..0}] run kill @s