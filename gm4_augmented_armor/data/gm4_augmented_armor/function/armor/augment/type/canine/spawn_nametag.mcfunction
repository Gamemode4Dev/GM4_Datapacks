# remove armor from wolf
# @s = wolf that is waering armor
# at @s
# run from armor/type/canine/wolf_interact_check

# spawn item with the data
summon item ~ ~ ~ {Tags:["gm4_aa_dropped_wolf_nametag"],Item:{id:"name_tag",count:1b}}
data modify entity @n[type=item,tag=gm4_aa_dropped_wolf_nametag,distance=..0.1] Item.components."minecraft:custom_name" set from storage gm4_augmented_armor:temp wolf.curr_name
