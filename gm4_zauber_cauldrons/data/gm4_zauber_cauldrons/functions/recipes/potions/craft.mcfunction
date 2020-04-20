# @s=boiling zauber cauldron with recipe inside
# at @s
# run from zauber_potions

# calculate amount of vexes to spawn
execute if score @s gm4_zc_fullness > expected_item_amount gm4_zc_fullness run function gm4_zauber_cauldrons:cauldron/use_extra_items

# finalize item summoning
summon item ~ ~.2 ~ {Item:{id:"minecraft:potion",Count:1b},Tags:["gm4_zc_new_potion"]}
execute as @e[type=item,dx=0,dy=0,dz=0,tag=gm4_zc_new_potion,limit=1] run function gm4_zauber_cauldrons:recipes/potions/spawn

# sounds and visuals
playsound entity.fishing_bobber.splash block @a[distance=..16] ~ ~ ~ 0.5 1
function gm4_zauber_cauldrons:cauldron/use_water
