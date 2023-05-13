# reduce cooldown on witch armor piece
# @s = player wearing armour
# at world spawn
# run from armor/modifier/type/witch/check

# mark for change
scoreboard players set $change gm4_ce_data 1

# reduce cooldown by 1 and check for it ending
execute store result storage gm4_combat_expanded:temp tag.gm4_combat_expanded.cooldown int 1 run scoreboard players remove $cooldown gm4_ce_data 1
execute if score $cooldown gm4_ce_data matches 0 run function gm4_combat_expanded:armor/modifier/type/witch/recharge
