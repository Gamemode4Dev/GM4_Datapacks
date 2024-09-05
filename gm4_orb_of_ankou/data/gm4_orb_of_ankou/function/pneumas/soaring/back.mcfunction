# @s = player with active soaring pneuma that has been damaged
# run from tick

tp @s @e[type=marker,tag=gm4_oa_soaring_location,limit=1,sort=nearest]
tag @s remove gm4_oa_soaring_damaged
kill @e[type=marker,tag=gm4_oa_soaring_location,limit=1,sort=nearest]
scoreboard players reset soaring_damaged gm4_pneuma_data
