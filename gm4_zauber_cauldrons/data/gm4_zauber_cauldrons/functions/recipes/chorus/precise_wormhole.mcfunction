# @s = boiling zauber cauldron with recipe inside
# at center of block
# run from count_chorus

# get bottled_vex nbt into blueprint
data modify storage gm4_zauber_cauldrons:blueprint/item/wormhole gm4_zauber_cauldrons.cauldron_pos set from storage gm4_zauber_cauldrons:temp/cauldron/ingredients Items[{tag:{gm4_zauber_cauldrons:{item:"bottled_vex"}}}].tag.gm4_zauber_cauldrons.cauldron_pos

# kill remaining items
execute align xyz run kill @e[type=item,dx=0,dy=0,dz=0]

# summon wormhole
loot spawn ~ ~.2 ~ loot gm4_zauber_cauldrons:recipes/chorus/wormhole

# make items in cauldron pickup-able instantly
execute align xyz as @e[type=item,dx=0,dy=0,dz=0] run data modify entity @s PickupDelay set value 0s

# cosmetics
execute at @s run particle minecraft:witch ~ ~.3 ~ .1 .1 .1 1 17
execute at @s run playsound minecraft:entity.ender_eye.death master @a[distance=..8] ~ ~ ~ 0.6 .2

# add oversized stacks to cauldron fullness to summon vexes
scoreboard players operation @s gm4_zc_fullness += $raw_chorus_fullness gm4_zc_chorus
scoreboard players operation @s gm4_zc_fullness += $popped_chorus_fullness gm4_zc_chorus

# set flag
scoreboard players set $recipe_success gm4_zc_data 1
