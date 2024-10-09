# modify shot arrows
# @s = arrow
# at unspecified
# run from check_arrow

# if origin is a player run function tag for expansions
execute if entity @s[type=player] run return run function #gm4_survival_refightalized:fired_arrow

# | Non-players:
# add damage to arrow
scoreboard players operation $arrow_damage gm4_sr_data += @s gm4_sr_arrow.damage_change
# add fire delay
scoreboard players operation @s gm4_sr_arrow.fire_delay_left = @s gm4_sr_arrow.fire_delay
attribute @s[scores={gm4_sr_arrow.fire_delay_left=1..}] generic.follow_range modifier add gm4_survival_refightalized:arrow_fire_delay -1 add_multiplied_total
