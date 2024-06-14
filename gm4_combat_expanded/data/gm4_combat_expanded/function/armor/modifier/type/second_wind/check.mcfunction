# check if armor should activate
# @s = player being checked
# at unspecified
# run from armor/check_modifier/safety

# activate armor if player is regenerating
execute if score @s[tag=!gm4_ce_second_wind.active] gm4_ce_hurt matches 1.. run function gm4_combat_expanded:armor/modifier/type/second_wind/activate

# translate damage taken to stored health if armor is active
execute if score @s[tag=gm4_ce_second_wind.active] gm4_ce_hurt matches 1.. at @s run function gm4_combat_expanded:armor/modifier/type/second_wind/store

# restore health when player is safe
execute unless score @s[tag=gm4_ce_second_wind.active] gm4_ce_natural_regen_damage matches 1.. at @s run function gm4_combat_expanded:armor/modifier/type/second_wind/restore
  