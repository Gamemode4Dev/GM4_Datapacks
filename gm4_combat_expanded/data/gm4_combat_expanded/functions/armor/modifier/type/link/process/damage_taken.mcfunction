# detect linked player taking damage
# @s = player taking damage
# at @s
advancement revoke @s only gm4_combat_expanded:damaged/armor/link

function gm4_combat_expanded:player/calculate_hp
scoreboard players operation $link.health gm4_ce_data = @s gm4_ce_health

execute if score $link.health gm4_ce_data matches 1.. as @a[tag=gm4_ce_linked,distance=..0.01] run function gm4_combat_expanded:armor/modifier/type/link/process/calc_damage
tag @s add gm4_ce_target
execute unless score $link.health gm4_ce_data matches 1.. as @a[tag=gm4_ce_linked,distance=..0.01] run function gm4_combat_expanded:armor/modifier/type/link/process/death
tag @s remove gm4_ce_target
