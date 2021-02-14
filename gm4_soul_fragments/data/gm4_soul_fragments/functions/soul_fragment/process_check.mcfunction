# @s = abandoned soul fragment
# at @s
# from main

# check if there are items or players nearby before processing
execute if entity @e[type=#gm4_soul_fragments:soul_target,distance=..22] run function gm4_soul_fragments:soul_fragment/process

function gm4_soul_fragments:soul_fragment/age
