# Give pole-related effects - jump boost on a cooldown and reduced fall damage
# @s = player holding poles
# at @s
# run from player_main

# Add jump boost effect (1 regularly, 2 if having an upwards velocity)
execute if score @s gm4_mountaineering_poles_jump_boost matches ..0 if score @s gm4_mountaineering_vy matches 2.. run effect give @s jump_boost 1 1 true
execute if score @s gm4_mountaineering_poles_jump_boost matches ..0 if score @s gm4_mountaineering_vy matches ..0 run effect give @s jump_boost 1 0 true

# Reduce jump cooldown
execute if score @s gm4_mountaineering_poles_jump_boost matches 1.. run scoreboard players remove @s gm4_mountaineering_poles_jump_boost 1

# If jump, reset cooldown and jump counter
execute if entity @s[scores={gm4_mountaineering_jump_counter=1..}] run scoreboard players set @s gm4_mountaineering_poles_jump_boost 3
scoreboard players reset @s gm4_mountaineering_jump_counter

# Give resistance before landing to reduce fall damage
execute if entity @s[nbt={OnGround:0b}] if block ~ ~-2 ~ minecraft:air run effect give @s resistance 1 1
execute if entity @s[nbt={OnGround:1b}] run effect clear @s resistance
