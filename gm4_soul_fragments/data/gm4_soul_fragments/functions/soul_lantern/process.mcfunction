# @s = soul in a lantern on the ground
# from main

# delay activation
scoreboard players add @s gm4_sf_timer 1
execute if entity @s[scores={gm4_sf_timer=4..}] run function gm4_soul_fragments:soul_lantern/activate

# force to release angry soul if not picked up in a while
execute if entity @s[scores={gm4_sf_timer=9}] run function gm4_soul_fragments:release_angry_soul
