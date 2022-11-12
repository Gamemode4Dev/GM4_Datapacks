# Give pole-related effects
# @s = player holding poles
# at @s
# run from player_main

# Add jump boost effects
function gm4_mountaineering:pole_effects/poles_jump_boost

execute if entity @s[nbt={OnGround:0b}] if block ~ ~-2 ~ minecraft:air run effect give @s resistance 1 1
execute if entity @s[nbt={OnGround:1b}] run effect clear @s resistance
