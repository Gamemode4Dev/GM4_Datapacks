# gives all players an id for lectern matching
# @s = new player
# located at @s
# run from advancement gm4_guidebook:lectern_id

execute store result score @s gm4_guide_id run scoreboard players add #max gm4_guide_id 1
