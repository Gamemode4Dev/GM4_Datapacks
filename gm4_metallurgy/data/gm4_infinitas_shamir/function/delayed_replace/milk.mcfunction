# Checks which hand slot player used to drink milk
# @s = player holding milk bucket, previously holding Infinitas Milk Bucket
# at @s
# run from gm4_infinitas_shamir:delayed_replace/check_tag 

execute store success score @s gm4_infinitas_success_check run item replace entity @s[advancements={gm4_infinitas_shamir:milk/drink_mainhand=true},predicate=gm4_infinitas_shamir:mainhand/after/use_bucket] weapon.mainhand with milk_bucket
execute if score @s gm4_infinitas_success_check matches 1 run item modify entity @s weapon.mainhand gm4_infinitas_shamir:restore_shamir
execute store success score @s gm4_infinitas_success_check run item replace entity @s[advancements={gm4_infinitas_shamir:milk/drink_offhand=true},predicate=gm4_infinitas_shamir:offhand/after/use_bucket] weapon.offhand with milk_bucket
execute if score @s gm4_infinitas_success_check matches 1 run item modify entity @s weapon.offhand gm4_infinitas_shamir:restore_shamir

# clean up
advancement revoke @s only gm4_infinitas_shamir:milk/drink_mainhand
advancement revoke @s only gm4_infinitas_shamir:milk/drink_offhand
tag @s remove gm4_infinitas_delay_replace
tag @s remove gm4_infinitas_delay_replace_milk
