# Checks which hand slot player used to place powder snow
# @s = player holding powder snow bucket, previously holding Infinitas Powder Snow Bucket
# at @s
# run from gm4_infinitas_shamir:delayed_replace/check_tag

execute store success score @s gm4_infinitas_success_check run item replace entity @s[advancements={gm4_infinitas_shamir:powder_snow/place_mainhand=true},predicate=gm4_infinitas_shamir:mainhand/after/use_bucket] weapon.mainhand with powder_snow_bucket
execute if score @s gm4_infinitas_success_check matches 1 run item modify entity @s weapon.mainhand gm4_infinitas_shamir:set_shamir_nbt
execute unless score @s gm4_infinitas_success_check matches 1 store success score @s gm4_infinitas_success_check run item replace entity @s[advancements={gm4_infinitas_shamir:powder_snow/place_offhand=true},predicate=gm4_infinitas_shamir:offhand/after/use_bucket] weapon.offhand with powder_snow_bucket
execute if score @s gm4_infinitas_success_check matches 1 run item modify entity @s weapon.offhand gm4_infinitas_shamir:set_shamir_nbt

advancement revoke @s only gm4_infinitas_shamir:powder_snow/place_mainhand
advancement revoke @s only gm4_infinitas_shamir:powder_snow/place_offhand

tag @s remove gm4_infinitas_delay_replace_powder_snow
