# @s = wither_rose_catcher marker at @s
# run from soul_forge/wither_roses/summon_indicator


# move the to the randomized position
$tp ~$(x) ~1 ~$(z)

# kill if not in air or on unsupported block
execute at @s if block ~ ~ ~ #gm4:no_collision unless block ~ ~-1 ~ #gm4:no_collision unless block ~ ~-1 ~ obsidian run tag @s add gm4_oa_rose_indicator_valid
execute if entity @s[tag=!gm4_oa_rose_indicator_valid] run return run kill @s

# set data
data merge entity @s {CustomName:"gm4_oa_wither_rose_catcher",Tags:["gm4_oa_wither_rose_catcher"]}

# play sound to indicate
execute at @s run playsound minecraft:entity.wither.ambient block @a ~ ~ ~ 0.6 1.4
