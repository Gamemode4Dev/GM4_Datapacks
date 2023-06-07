# Withdraw xp
# @s = players directly below ender chest
# at @s
# run from tick

title @s actionbar [{"translate":"text.gm4.xp_storage.stored_experience","fallback":"Stored Experience: ","color":"green"},{"translate":"text.gm4.xp_storage.stored_experience.points","fallback":"%s Points","with":[{"score":{"name":"@s","objective":"gm4_stored_xp"}}],"color":"dark_green"}]
execute if score @s gm4_stored_xp matches 5.. run experience add @s 5 points
execute if score @s gm4_stored_xp matches 5.. run scoreboard players remove @s gm4_stored_xp 5
execute if score @s gm4_stored_xp matches 1..4 run experience add @s 1 points
execute if score @s gm4_stored_xp matches 1..4 run scoreboard players remove @s gm4_stored_xp 1

# play xp effect
execute if score @s gm4_stored_xp matches 1.. run summon experience_orb ~ ~1.8 ~ {Age:5995,Value:0}
