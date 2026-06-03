# @s = heated water zauber cauldron with enchanted prismarine shard and golden {{piece}} inside
# at @s (center of block)
# run from recipe/armor/{{piece}}/select_flavor

# remove ingredients
execute align xyz run kill @e[type=item,dx=0,dy=0,dz=0]

# summon item
# item modifier is generated via beet from templates
summon item ~ ~.2 ~ {Tags:["gm4_zc_temp_armor_piece"],Item:{id:"minecraft:golden_{{piece}}",count:1}}
execute as @e[type=item,dx=0,dy=0,dz=0,tag=gm4_zc_temp_armor_piece,limit=1] run function gm4_zauber_cauldrons:recipes/armor/init_piece with storage gm4_zauber_cauldrons:temp/cauldron/ingredients items[{count:1,id:"minecraft:golden_{{piece}}"}]
item modify entity @e[type=item,dx=0,dy=0,dz=0,tag=gm4_zc_temp_armor_piece,limit=1] contents gm4_zauber_cauldrons:armor/{{piece}}/{{flavor}}
tag @e[type=item,dx=0,dy=0,dz=0] remove gm4_zc_temp_armor_piece

# set flag
scoreboard players set $recipe_success gm4_zc_data 1
