# moneo main
# run from #metallurgy_expansion:main

execute as @a[gamemode=!spectator,tag=gm4_has_moneo] run scoreboard players reset @s gm4_moneo_max
tag @a remove gm4_has_moneo

scoreboard players reset tool_max_damage gm4_ml_data
scoreboard players reset tool_current_damage gm4_ml_data

execute as @a[gamemode=!spectator,nbt={SelectedItem:{tag:{gm4_metallurgy:{active_shamir:"moneo"}}}}] at @s run function moneo_shamir:active