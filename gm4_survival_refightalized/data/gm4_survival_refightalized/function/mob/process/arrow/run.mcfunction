# modify shot arrows
# @s = arrow
# at unspecified
# run from check_arrow

# add the arrow damage change score to this arrow's damage
scoreboard players operation $arrow_damage gm4_sr_data += @s gm4_sr_proj_damage_change
# if origin is not a player apply their fire delay
execute if score @s[type=!player] gm4_sr_proj_fire_delay matches 1.. run function gm4_survival_refightalized:mob/process/arrow/add_fire_delay
