# run from armor/check_modifier
# @s = player wearing witch armour

# get cooldown on armor
execute store result score $cooldown gm4_ce_data run data get storage gm4_combat_evolved:temp tag.gm4_combat_evolved.cooldown

# run if ready and damaged
execute if score $cooldown gm4_ce_data matches 0 if score @s gm4_ce_t_hurt matches 3.. at @s run function gm4_combat_evolved:armor/modifiers/type/witch/activate

# if on cooldown reduce it
execute if score $cooldown gm4_ce_data matches 1.. run function gm4_combat_evolved:armor/modifiers/type/witch/tick_cooldown