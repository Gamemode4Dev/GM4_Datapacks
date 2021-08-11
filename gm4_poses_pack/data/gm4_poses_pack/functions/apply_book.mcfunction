# @s = armor_stand to be modified
# at @s
# run from gm4_better_armour_stands/store_book_pages

# Move or rotate armor stand according to player position.
execute if data storage gm4_better_armour_stands:temp {pages:["move"]} positioned as @p[tag=gm4_bas_user,distance=..1] run tp @s ~ ~ ~
execute if data storage gm4_better_armour_stands:temp {pages:["rotate"]} rotated as @p[tag=gm4_bas_user,distance=..1] run tp @s ~ ~ ~ ~ ~

# Rotate armor stand part according to player rotation.
execute if data storage gm4_better_armour_stands:temp {pages:["head"]} run function gm4_poses_pack:pose/head
execute if data storage gm4_better_armour_stands:temp {pages:["body"]} run function gm4_poses_pack:pose/body
execute if data storage gm4_better_armour_stands:temp {pages:["arms"]} run function gm4_poses_pack:pose/arms
execute if data storage gm4_better_armour_stands:temp {pages:["legs"]} run function gm4_poses_pack:pose/legs

# Grant advancement if any poses were changed.
execute if entity @s[tag=gm4_pose_changed] run function gm4_poses_pack:pose_changed

# Copy and paste from armor stand item.
execute if data storage gm4_better_armour_stands:temp {pages:["copy"]} if entity @p[tag=gm4_bas_user,nbt={Inventory:[{Slot:-106b,id:"minecraft:armor_stand"}]}] run function gm4_poses_pack:copy
execute if data storage gm4_better_armour_stands:temp {pages:["paste"]} if data entity @p[tag=gm4_bas_user] Inventory[-1].tag.EntityTag run function gm4_poses_pack:paste
