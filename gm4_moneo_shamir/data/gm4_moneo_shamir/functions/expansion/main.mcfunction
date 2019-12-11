# moneo main
# run from expansion/pulse_check

tag @a remove gm4_has_moneo

scoreboard players reset tool_max_damage gm4_ml_data
scoreboard players reset tool_current_damage gm4_ml_data

execute as @a[gamemode=!spectator,nbt={SelectedItem:{tag:{gm4_metallurgy:{active_shamir:"moneo"}}}}] at @s run function gm4_moneo_shamir:active
