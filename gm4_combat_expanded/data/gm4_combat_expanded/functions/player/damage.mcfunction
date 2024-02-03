# damage player according to damage storage
# @s = player that is taking damage
# at unspecified
# run from armor/modifier/type/half/damage
# run from weapon/modifier/link/process/calc_damage
# run from armor/modifier/type/link/process/set_health_damage
# run from weapon/modifier/delay/explode_player

# tags are added so damage dealing advancements will ignore this
tag @s add gm4_ce_target
$damage @s $(damage) generic_kill by @s
tag @s remove gm4_ce_target
