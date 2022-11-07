# Checks which hand slot player used to pickup a fish
# @s = player holding fish bucket, previously holding Infinitas Water Bucket
# at @s
# run from gm4_infinitas_shamir:delayed_replace/check_tag

scoreboard players reset @s gm4_infinitas_success_check

execute if entity @s[advancements={gm4_infinitas_shamir:water/pickup_mainhand=true}] run function gm4_infinitas_shamir:delayed_replace/fish/mainhand_check
execute unless score @s gm4_infinitas_success_check matches 1 if entity @s[advancements={gm4_infinitas_shamir:water/pickup_offhand=true}] run function gm4_infinitas_shamir:delayed_replace/fish/offhand_check

advancement revoke @s only gm4_infinitas_shamir:water/pickup_mainhand
advancement revoke @s only gm4_infinitas_shamir:water/pickup_offhand

tag @s remove gm4_infinitas_delay_replace_fish
