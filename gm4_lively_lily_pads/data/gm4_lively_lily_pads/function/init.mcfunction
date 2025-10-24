execute unless score lively_lily_pads gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Lively Lily Pads"}
execute unless score lively_lily_pads gm4_earliest_version < lively_lily_pads gm4_modules run scoreboard players operation lively_lily_pads gm4_earliest_version = lively_lily_pads gm4_modules
scoreboard players set lively_lily_pads gm4_modules 1

# detect pre-gm4 lively lily pads
# | We do this in mechanics/interactions/placement/interact_rcd

scoreboard objectives add gm4_llp.data dummy
scoreboard objectives add gm4_llp.id dummy
execute unless score $next gm4_llp.id matches 0.. run scoreboard players set $next gm4_llp.id 0

schedule function gm4_lively_lily_pads:main 1t
schedule function gm4_lively_lily_pads:tick 1t
