# @s = player holding a soul in a lantern
# at @s
# from player/submain

execute if predicate gm4_soul_fragments:soul_in_a_lantern/in_mainhand run function gm4_soul_fragments:player/items/process_mainhand_soul
execute if predicate gm4_soul_fragments:soul_in_a_lantern/in_offhand run function gm4_soul_fragments:player/items/process_offhand_soul
