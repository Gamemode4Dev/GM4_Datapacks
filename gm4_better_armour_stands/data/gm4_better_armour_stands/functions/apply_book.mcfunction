# @s = armor_stand to be modified
# at @s
# run from store_book_pages

# Restore armor stand state to default.
execute if data storage gm4_better_armour_stands:temp {pages:["default"]} run function gm4_better_armour_stands:default

# Remove armor stand arms.
execute if data storage gm4_better_armour_stands:temp {pages:["no arms"]} run function gm4_better_armour_stands:toggle/no_arms

# Toggle armor stand base.
execute if data storage gm4_better_armour_stands:temp {pages:["base"]} run function gm4_better_armour_stands:toggle/base

# Toggle armor stand height.
execute if data storage gm4_better_armour_stands:temp {pages:["size"]} run function gm4_better_armour_stands:toggle/size

# Toggle armor stand visibility.
execute if data storage gm4_better_armour_stands:temp {pages:["visible"]} run function gm4_better_armour_stands:toggle/visible

# Toggle armor stand gravity.
execute if data storage gm4_better_armour_stands:temp {pages:["gravity"]} run function gm4_better_armour_stands:toggle/gravity

# Rotate the armor stand by predefined intervals.
execute if data storage gm4_better_armour_stands:temp {pages:["turn"]} run function gm4_better_armour_stands:toggle/turn

# Move or rotate armor stand according to player position.
execute if data storage gm4_better_armour_stands:temp {pages:["rotate"]} rotated as @p[tag=gm4_bas_active] run tp @s ~ ~ ~ ~ ~
execute if data storage gm4_better_armour_stands:temp {pages:["move"]} run function gm4_better_armour_stands:move/move

# Copy and paste from armor stand item.
execute if data storage gm4_better_armour_stands:temp {pages:["copy"]} if entity @p[tag=gm4_bas_active,nbt={Inventory:[{Slot:-106b,id:"minecraft:armor_stand"}]}] run function gm4_better_armour_stands:copy
execute if data storage gm4_better_armour_stands:temp {pages:["paste"]} if data entity @p[tag=gm4_bas_active] Inventory[-1].tag.EntityTag run function gm4_better_armour_stands:paste

# Equip item into specified slot.
execute if data storage gm4_better_armour_stands:temp {pages:["equip"]} run function gm4_better_armour_stands:equip/select

# Change armor stand poses.
execute if data storage gm4_better_armour_stands:temp {pages:["pose"]} run function gm4_better_armour_stands:pose/select
