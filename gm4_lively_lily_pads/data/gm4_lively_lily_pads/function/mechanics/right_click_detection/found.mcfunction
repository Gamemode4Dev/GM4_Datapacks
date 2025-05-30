# execute at nearest lily pad in front of player
# @s = player holding supported item
# at position of lily pad block, align xyz positioned ~.5 ~ ~.5
# run from mechanics/right_click_detection/ray

# spawn an interaction if needed
execute unless entity @e[type=interaction,tag=gm4_llp_rcd,distance=..0.1,limit=1] \
  run summon minecraft:interaction ~ ~ ~ {Glowing:1b,width:0.5f,height:0.5f,response:1b,Tags:["gm4_llp_rcd","smithed.entity","smithed.strict"]}

# visuals
particle composter ~ ~0.2 ~ 0 0 0 .01 3
particle composter ~ ~0.4 ~ 0 0 0 .01 3

# start loop
scoreboard players set $timer gm4_llp.data 10
function gm4_lively_lily_pads:mechanics/right_click_detection/loop
