#@s = player if block ~ ~2 ~ ender_chest
#run from pulse_check

title @s actionbar [{"translate":"%1$s","with":["Stored Experience: ",{"translate":"text.gm4.xp_storage.stored_experience"}],"color":"green"},{"translate":"%1$s","with":[[{"score":{"name":"@s","objective":"gm4_stored_xp"}}," Points"],{"translate":"text.gm4.xp_storage.stored_experience.points","with":[{"score":{"name":"@s","objective":"gm4_stored_xp"}}]}],"color":"dark_green"}]
execute if score @s gm4_stored_xp matches 5.. run experience add @s 5 points
execute if score @s gm4_stored_xp matches 5.. run scoreboard players remove @s gm4_stored_xp 5
execute if score @s gm4_stored_xp matches 1..4 run experience add @s 1 points
execute if score @s gm4_stored_xp matches 1..4 run scoreboard players remove @s gm4_stored_xp 1

#play xp effect
execute if score @s gm4_stored_xp matches 1.. run summon experience_orb ~ ~1.8 ~ {Age:5995,Value:0}
