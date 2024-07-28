# process player
# @s = online player
# at unspecified
# run from base combat_expanded module, from function player/process

# check for archer armor
tag @s[tag=gm4_ce_wearing_archer,predicate=!gm4_combat_expanded_armor:modified_armor/archer] remove gm4_ce_wearing_archer
execute if entity @s[tag=!gm4_ce_wearing_archer,predicate=gm4_combat_expanded_armor:modified_armor/archer] run function gm4_combat_expanded_armor:armor/modifier/type/archer/activate

# remove husk sprint score if player didn't sprint for too long
execute unless score @s gm4_ce_sprinting matches 1.. run scoreboard players add @s[scores={gm4_ce_t_sprinting=1..}] gm4_ce_sprinting_timeout 1
scoreboard players reset @s[scores={gm4_ce_sprinting_timeout=3..,gm4_ce_t_sprinting=1..}] gm4_ce_t_sprinting
scoreboard players reset @s gm4_ce_husk_pieces

# remove tags
tag @s remove gm4_ce_beacon_active
tag @s remove gm4_ce_linked
execute if entity @s[tag=gm4_ce_immune_active] run function gm4_combat_expanded_armor:player/clear_immunities

# process armor
execute if predicate gm4_combat_expanded_armor:modified_armor/wearing run function gm4_combat_expanded_armor:armor/process

# remove second wind tag if armor is taken off
tag @s[tag=gm4_ce_second_wind.active,predicate=!gm4_combat_expanded_armor:modified_armor/second_wind] remove gm4_ce_second_wind.active
