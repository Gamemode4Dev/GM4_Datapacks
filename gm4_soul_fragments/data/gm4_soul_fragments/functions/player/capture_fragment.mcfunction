# @s = player holding a soul lantern approached by a soul fragment that isn't their own
# from intake_fragment

tag @s add gm4_sf_capturing

execute if predicate gm4_soul_fragments:soul_lantern/in_mainhand unless predicate gm4_soul_fragments:soul_in_a_lantern/in_mainhand run tag @s add gm4_sf_mainhand
execute if entity @s[tag=gm4_sf_mainhand] run function gm4_soul_fragments:player/items/capture_in_mainhand
execute if entity @s[tag=!gm4_sf_mainhand] if predicate gm4_soul_fragments:soul_lantern/in_offhand unless predicate gm4_soul_fragments:soul_in_a_lantern/in_offhand run function gm4_soul_fragments:player/items/capture_in_offhand
tag @s remove gm4_sf_mainhand

tag @s remove gm4_sf_capturing
