# execute at nearest lily pad in front of player
# @s = player holding supported item
# at position of lily pad block, align xyz positioned ~.5 ~.02 ~.5
# run from mechanics/right_click_detection/ray

# spawn an interaction if needed
execute unless entity @e[type=interaction,tag=gm4_llp_placement_rcd,distance=..0.1,limit=1] \
  run summon minecraft:interaction ~ ~ ~ {Glowing:1b,width:0.4f,height:0.3f,response:1b,Tags:["gm4_llp_placement_rcd","smithed.entity","smithed.strict"]}

# start loop
scoreboard players set $timer gm4_llp.data 10
function gm4_lively_lily_pads:mechanics/right_click_detection/loop
