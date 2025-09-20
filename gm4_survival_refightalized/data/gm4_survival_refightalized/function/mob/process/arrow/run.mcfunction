# modify shot arrows
# @s = arrow origin
# at unspecified
# run from check_arrow

# if origin is a player run function tag for expansions
execute if entity @s[type=player] run return run function #gm4_survival_refightalized:player_fired_arrow

# | Non-players:
# add damage to arrow
scoreboard players operation $arrow_damage gm4_sr_data += @s gm4_sr_arrow.damage_change
# add fire delay
# ( A modifier that removes all follow_range is added to stop the entity from firing more arrows)
scoreboard players operation @s gm4_sr_arrow.fire_delay_left = @s gm4_sr_arrow.fire_delay
attribute @s[scores={gm4_sr_arrow.fire_delay_left=1..}] minecraft:follow_range modifier add gm4_survival_refightalized:arrow_fire_delay -1 add_multiplied_total
