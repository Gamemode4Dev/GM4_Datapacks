# @s = armor_stand to be modified
# at @s
# run from book/process

# restore armor_stand state to default
execute if data storage gm4_better_armour_stands:temp {pages:[{raw:"default"}]} run function gm4_better_armour_stands:default/check

# remove armor_stand arms
execute if data storage gm4_better_armour_stands:temp {pages:[{raw:"arms"}]} run function gm4_better_armour_stands:toggle/arms/arms

# toggle armor_stand base
execute if data storage gm4_better_armour_stands:temp {pages:[{raw:"base"}]} run function gm4_better_armour_stands:toggle/base

# toggle armor_stand height
execute if data storage gm4_better_armour_stands:temp {pages:[{raw:"size"}]} run function gm4_better_armour_stands:toggle/size

# toggle armor_stand visibility
execute if data storage gm4_better_armour_stands:temp {pages:[{raw:"visible"}]} run function gm4_better_armour_stands:toggle/visible

# toggle armor_stand gravity
execute if data storage gm4_better_armour_stands:temp {pages:[{raw:"gravity"}]} run function gm4_better_armour_stands:toggle/gravity

# rotate the armor_stand by predefined intervals
execute if data storage gm4_better_armour_stands:temp {pages:[{raw:"turn"}]} run function gm4_better_armour_stands:toggle/turn

# equip item into specified slot
execute if data storage gm4_better_armour_stands:temp {pages:[{raw:"equip"}]} run function gm4_better_armour_stands:equip/select

# flip full pose of armor_stand
execute if data storage gm4_better_armour_stands:temp {pages:[{raw:"flip"}]} run function gm4_better_armour_stands:pose/flip

# copy and paste from armor_stand item
execute if data storage gm4_better_armour_stands:temp {pages:[{raw:"copy"}]} if entity @a[tag=gm4_bas_active,limit=1,predicate=gm4_better_armour_stands:holding/offhand/armor_stand] run function gm4_better_armour_stands:pose/copy
execute if data storage gm4_better_armour_stands:temp {pages:[{raw:"paste"}]} if items entity @a[tag=gm4_bas_active,limit=1] weapon.offhand *[entity_data] run function gm4_better_armour_stands:pose/paste

# change armor_stand poses
execute if data storage gm4_better_armour_stands:temp {pages:[{raw:"pose"}]} run function gm4_better_armour_stands:pose/select
execute unless score @s gm4_bas_mode matches 1.. if data storage gm4_better_armour_stands:temp {pages:[{raw:"pose mirror"}]} run function gm4_better_armour_stands:pose/select

# move/rotate
execute unless score @s gm4_bas_mode matches 1.. if data storage gm4_better_armour_stands:temp {pages:[{raw:"move"}]} run function gm4_better_armour_stands:pose/move
execute unless score @s gm4_bas_mode matches 1.. if data storage gm4_better_armour_stands:temp {pages:[{raw:"rotate"}]} run function gm4_better_armour_stands:pose/rotate

# disable armor_stand interaction
execute if data storage gm4_better_armour_stands:temp {pages:[{raw:"lock"}]} unless entity @s[tag=gm4_bas_locked] run function gm4_better_armour_stands:toggle/lock/lock
execute if data storage gm4_better_armour_stands:temp {pages:[{raw:"unlock"}]} if entity @s[tag=gm4_bas_locked] run function gm4_better_armour_stands:toggle/lock/unlock
