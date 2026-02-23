# set smeltery to unlit state
# @s = smeltery marker
# at @s
# run from process

item replace entity @e[type=item_display,tag=gm4_smeltery_display,distance=..0.1,limit=1] contents with iron_block[custom_model_data={strings:["gm4_smelteries:block/smeltery_unlit"]}]
item replace entity @e[type=item_display,tag=gm4_smeltery_cauldron,distance=..0.1,limit=1] contents with air
tag @s remove gm4_smeltery_lit
