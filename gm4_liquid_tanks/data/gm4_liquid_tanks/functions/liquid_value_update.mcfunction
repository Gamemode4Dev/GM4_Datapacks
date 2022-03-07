#@s = liquid tank
#run from liquid_tanks:process

# say starting vupdate
# tellraw @a {"nbt":"Pos","entity":"@s"}
# tellraw @a [{"score":{"name":"@s","objective":"gm4_lt_value"}},{"text":","},{"score":{"name":"@s","objective": "gm4_lt_prior_val"}}]

#normalize incase of overflow
scoreboard players operation @s gm4_lt_value < @s gm4_lt_max

#store new value of prior_value
scoreboard players operation @s gm4_lt_prior_val = @s gm4_lt_value

#if value of 0, set to empty
execute if score @s gm4_lt_value matches ..0 at @s run function gm4_liquid_tanks:empty

#calculating teleport distance
scoreboard players operation last_liquid_height gm4_lt_disp_val = @s gm4_lt_disp_val
scoreboard players operation liquid_height_calc gm4_lt_disp_val = @s gm4_lt_value
scoreboard players set #10 gm4_lt_disp_val 10
scoreboard players operation liquid_height_calc gm4_lt_disp_val *= #10 gm4_lt_disp_val
scoreboard players operation liquid_height_calc gm4_lt_disp_val /= @s gm4_lt_max
scoreboard players operation @s gm4_lt_disp_val = liquid_height_calc gm4_lt_disp_val
scoreboard players operation liquid_height_calc gm4_lt_disp_val -= last_liquid_height gm4_lt_disp_val

#teleport proper number of times.
execute if score liquid_height_calc gm4_lt_disp_val matches 1.. at @s positioned ~ ~-.5 ~ run function gm4_liquid_tanks:teleport_display_up
execute if score liquid_height_calc gm4_lt_disp_val matches ..-1 at @s positioned ~ ~-.5 ~ run function gm4_liquid_tanks:teleport_display_down

# tellraw @a [{"score":{"name":"@s","objective":"gm4_lt_value"}},{"text":","},{"score":{"name":"@s","objective": "gm4_lt_prior_val"}}]
# say ending vupdate
