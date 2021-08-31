# run from active_armor_chest
# @s = player wearing the moneo elytra

scoreboard players operation $tool_max_damage gm4_ml_data -= $tool_current_damage gm4_ml_data

tag @s[nbt={FallFlying:1b}] add gm4_moneo_ff

execute if score $tool_max_damage gm4_ml_data matches 10..20 run effect give @s[tag=gm4_moneo_ff] minecraft:slowness 2 1
execute if score $tool_max_damage gm4_ml_data matches 10..20 at @s[tag=gm4_moneo_ff] run playsound minecraft:entity.bat.takeoff master @s ~ ~ ~ 5 1.65
execute if score $tool_max_damage gm4_ml_data matches 2..20 at @s[tag=!gm4_moneo_ff] run playsound minecraft:entity.bat.takeoff master @s ~ ~ ~ 5 1.65
execute if score $tool_max_damage gm4_ml_data matches 2..9 run effect give @s[tag=gm4_moneo_ff] minecraft:slowness 2 2
execute if score $tool_max_damage gm4_ml_data matches 2..9 at @s[tag=gm4_moneo_ff] run playsound minecraft:block.bell.use master @s ~ ~ ~ 5 0

tag @s remove gm4_moneo_ff
