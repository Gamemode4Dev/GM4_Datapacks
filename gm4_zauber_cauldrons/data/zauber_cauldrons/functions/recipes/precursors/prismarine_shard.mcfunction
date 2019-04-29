#@s=boiling zauber cauldron with a precursor inside.
#at @s
#run from cauldron/recipe_checks

#set expected fullness for these recipes
scoreboard players set expected_item_amount gm4_zc_fullness 1
#recipe
execute align xyz run kill @e[type=item,dx=0,dy=0,dz=0]
summon item ~ ~.2 ~ {Item:{id:"minecraft:prismarine_shard",Count:1b,tag:{Enchantments:[{lvl:1s,id:"minecraft:unbreaking"}],gm4_zauber_cauldrons:{item:"enchanted_prismarine_shard"},HideFlags:1,display:{Name:"{\"text\":\"Enchanted Prismarine Shard\",\"italic\":false,\"color:\":\"aqua\"}"}}}}
experience add @a[level=30..,distance=..2,limit=1,sort=nearest] -30 levels
playsound block.portal.travel block @a[distance=..16] ~ ~ ~ .2 1.2
particle enchanted_hit ~ ~.4 ~ .1 .1 .1 .15 10

#use water and play sound once a recipe ran
execute if score @s gm4_zc_fullness > expected_item_amount gm4_zc_fullness run function zauber_cauldrons:cauldron/use_extra_items
function zauber_cauldrons:cauldron/use_water

#reset fake players
scoreboard players reset expected_item_amount gm4_zc_fullness
