# @s = boiling zauber cauldron with a precursor inside.
# at center of block
# run from cauldron/recipe_checks

# set expected fullness for these recipes
scoreboard players set $expected_item_amount gm4_zc_fullness 1

# remove ingredients
execute align xyz run kill @e[type=item,dx=0,dy=0,dz=0]

# recipe
loot spawn ~ ~.2 ~ loot gm4_zauber_cauldrons:recipes/precursors/enchanted_prismarine_shard

# make items in cauldron pickup-able instantly
execute align xyz as @e[type=item,dx=0,dy=0,dz=0] run data modify entity @s PickupDelay set value 0s

# use xp
execute as @a[level=30..,distance=..2,limit=1,sort=nearest,gamemode=!spectator] run experience add @s[gamemode=!creative] -30 levels

# sounds and visuals
playsound block.portal.travel block @a[distance=..16] ~ ~ ~ .2 1.2
particle enchanted_hit ~ ~.4 ~ .1 .1 .1 .15 10

# use water and play sound once a recipe ran
function gm4_zauber_cauldrons:cauldron/structure/modify/use_water

# check for leftover items
execute if score @s gm4_zc_fullness > $expected_item_amount gm4_zc_fullness run function gm4_zauber_cauldrons:cauldron/structure/use_extra_items

# reset fake players
scoreboard players reset $expected_item_amount gm4_zc_fullness
