# Deposit 1 level
# @s = players on top of ender chest
# at @s
# run from deposit_mode_check and dump_all

execute store result score @s gm4_xp_calc run xp query @s points
execute unless entity @s[level=0] run scoreboard players add @s gm4_xp_calc 1
scoreboard players set loop_counter gm4_xp_calc 0
execute if score @s gm4_xp_calc matches 1.. run function gm4_xp_storage:xp_deposit_loop
scoreboard players reset loop_counter gm4_xp_calc

title @s actionbar [{"translate":"%1$s%3427655$s","with":["Stored Experience: ",{"translate":"text.gm4.xp_storage.stored_experience"}],"color":"green"},{"translate":"%1$s%3427655$s","with":[[{"score":{"name":"@s","objective":"gm4_stored_xp"}}," Points"],{"translate":"text.gm4.xp_storage.stored_experience.points","with":[{"score":{"name":"@s","objective":"gm4_stored_xp"}}]}],"color":"dark_green"}]
playsound minecraft:entity.experience_orb.pickup block @s
