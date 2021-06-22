# @s = boiling zauber cauldron with recipe inside
# at @s align xyz
# run from count_chorus

# copy target coordinates and dimension to storage
data modify storage gm4_zauber_cauldrons:temp/item/wormhole/common Item.tag.gm4_zauber_cauldrons.cauldron_pos set from entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{tag:{gm4_zauber_cauldrons:{item:"bottled_vex"}}}},limit=1] Item.tag.gm4_zauber_cauldrons.cauldron_pos

# kill remaining items
kill @e[type=item,dx=0,dy=0,dz=0]

# summon wormhole
execute at @s run summon item ~ ~.2 ~ {Item:{id:"minecraft:potion",Count:1b},Tags:["gm4_zc_new_wormhole_bottle"]}
execute as @e[type=item,dx=0,dy=0,dz=0,tag=gm4_zc_new_wormhole_bottle,limit=1] run function gm4_zauber_cauldrons:recipes/chorus/precise_wormhole/spawn

# cosmetics
execute at @s run particle minecraft:witch ~ ~.3 ~ .1 .1 .1 1 17
execute at @s run playsound minecraft:entity.ender_eye.death master @a[distance=..8] ~ ~ ~ 1 .2

# add oversized stacks to cauldron fullness to summon vexes
scoreboard players operation @s gm4_zc_fullness += raw_chorus_fullness gm4_zc_chorus
scoreboard players operation @s gm4_zc_fullness += popped_chorus_fullness gm4_zc_chorus

scoreboard players set $recipe_success gm4_zc_data 1
