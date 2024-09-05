# @s = soul forge without fire
# run from main

# store armor items into storage
data modify storage gm4_orb_of_ankou:temp ArmorItems set from entity @s ArmorItems

# create a soul shard if valid ingredient count
execute if score @s gm4_oa_essence matches 13.. if score @s gm4_oa_powder >= required gm4_oa_powder if score @s gm4_oa_glowstone >= required gm4_oa_glowstone run function gm4_orb_of_ankou:soul_forge/outputs/create_shard

# fuse soul shard into orb if valid ingredient count
execute if entity @s[tag=gm4_oa_has_orb,tag=gm4_oa_has_shard] if score @s gm4_oa_tears >= required gm4_oa_tears if score @s gm4_oa_roses >= required gm4_oa_roses run function gm4_orb_of_ankou:soul_forge/outputs/check_fuse

# summon entities for extra ingredients
execute if score @s gm4_oa_powder matches 1.. run function gm4_orb_of_ankou:soul_forge/entities/summon_powder_sprite
execute if score @s gm4_oa_glowstone matches 1.. run function gm4_orb_of_ankou:soul_forge/entities/summon_glowstone_sprite
execute if score @s gm4_oa_tears matches 1.. run function gm4_orb_of_ankou:soul_forge/entities/summon_wandering_tear
execute if score @s gm4_oa_roses matches 1.. run function gm4_orb_of_ankou:soul_forge/entities/withering_magic

# summon endermites for extra essences stored inside the soul forge
execute if score @s gm4_oa_essence matches 1.. run function gm4_orb_of_ankou:soul_forge/entities/summon_extra_essence

# if orb and shard weren't fused, summon entities for those extras
execute if entity @s[tag=gm4_oa_has_orb] run function gm4_orb_of_ankou:soul_forge/entities/summon_extra_orb
execute if entity @s[tag=gm4_oa_has_shard] run function gm4_orb_of_ankou:soul_forge/entities/summon_extra_shard

#visuals
playsound minecraft:block.fire.extinguish block @a[distance=..12] ~ ~ ~ .5 .3
particle minecraft:cloud ~ ~0.5 ~ 0.3 0.3 0.3 0 20

data remove storage gm4_orb_of_ankou:temp ArmorItems
kill @s
