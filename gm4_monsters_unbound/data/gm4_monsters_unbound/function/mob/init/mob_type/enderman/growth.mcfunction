# replace enderman with a 3 skeletons
# @s = enderman
# at @s
# run from mob/init/mob_type/enderman/base

execute if biome ~ ~ ~ mangrove_swamp run summon bogged ~.05 ~ ~ {Tags:["gm4_sr_extra_mob"]}
execute if biome ~ ~ ~ snowy_taiga run summon stray ~.05 ~ ~ {Tags:["gm4_sr_extra_mob"]}
execute unless biome ~ ~ ~ mangrove_swamp unless biome ~ ~ ~ snowy_taiga run summon skeleton ~.05 ~ ~ {Tags:["gm4_sr_extra_mob"]}
summon skeleton ~0.15 ~ ~-0.15 {Tags:["gm4_sr_extra_mob"]}
summon skeleton ~-0.15 ~ ~0.15 {Tags:["gm4_sr_extra_mob"]}
scoreboard players set $mob_extras gm4_sr_data 1
