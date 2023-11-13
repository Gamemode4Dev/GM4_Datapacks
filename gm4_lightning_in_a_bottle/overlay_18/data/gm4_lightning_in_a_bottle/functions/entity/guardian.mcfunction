# Creates a Guardian from Prismarine Bricks
# @s = lightning bolt
# positioned 1 block above Prismarine Bricks
# run from lightning/check

setblock ~ ~ ~ air
summon guardian ~ ~ ~ {active_effects:[{id:'minecraft:regeneration',duration:20,amplifier:10b,show_particles:0b}]}

# set fake player flag
scoreboard players set $found_block gm4_liab_data 1
