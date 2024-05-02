# Checks which hand slot player used to pickup liquid
# @s = player now holding filled bucket, previously holding Infinitas Empty Bucket
# at @s
# run from gm4_infinitas_shamir:delayed_replace/check_tag

execute store success score @s gm4_infinitas_success_check run item replace entity @s[advancements={gm4_infinitas_shamir:empty/pickup_mainhand=true},predicate=gm4_infinitas_shamir:mainhand/after/empty] weapon.mainhand with bucket
execute if score @s gm4_infinitas_success_check matches 1 run item modify entity @s weapon.mainhand gm4_infinitas_shamir:restore_shamir
execute store success score @s gm4_infinitas_success_check run item replace entity @s[advancements={gm4_infinitas_shamir:empty/pickup_offhand=true},predicate=gm4_infinitas_shamir:offhand/after/empty] weapon.offhand with bucket
execute if score @s gm4_infinitas_success_check matches 1 run item modify entity @s weapon.offhand gm4_infinitas_shamir:restore_shamir

# clean up
advancement revoke @s only gm4_infinitas_shamir:empty/pickup_mainhand
advancement revoke @s only gm4_infinitas_shamir:empty/pickup_offhand
tag @s remove gm4_infinitas_delay_replace
tag @s remove gm4_infinitas_delay_replace_empty
