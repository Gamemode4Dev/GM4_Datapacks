# @s = Anchor Finder marker that has found an anchor
# run from blocks/anchor/scan

tp @s ^ ^ ^-1
scoreboard players operation @s gm4_ta_jam_id = @e[type=marker,tag=gm4_ta_selected_jammer,limit=1] gm4_ta_jam_id
tag @s add gm4_ta_found_anchor
