# execute at nearest lily pad in front of player
# @s = player holding supported item
# at lily_pad align xyz
# run from mechanics/right_click_detection/ray

# visuals
 particle scrape ~.5 ~.12 ~.5 0 0 0 0 1

# spawn an interaction if needed
scoreboard players operation $player gm4_llp.id = @s gm4_llp.id
execute unless entity @e[type=interaction,tag=gm4_llp_placement_rcd,dx=0,limit=1] positioned ~.5 ~.02 ~.5 \
  summon minecraft:interaction run function gm4_lively_lily_pads:mechanics/right_click_detection/create

# start loop
scoreboard players set $timer gm4_llp.data 10
function gm4_lively_lily_pads:mechanics/right_click_detection/loop
