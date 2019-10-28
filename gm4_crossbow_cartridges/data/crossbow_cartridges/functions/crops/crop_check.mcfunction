#run from arrow_in_ground
# @s = @e[type=minecraft:arrow,tag=gm4_cb_crops,nbt={inGround:1b}]
# at @s

#add tag if crops can be placed
execute if block ~ ~-.1 ~ #crossbow_cartridges:dirty if block ~ ~.1 ~ #crossbow_cartridges:replaceable run tag @s add gm4_cb_placecrop

#place crop or summon item
execute if entity @s[tag=gm4_cb_placecrop] run function crossbow_cartridges:crops/crop_place
execute unless entity @s[tag=gm4_cb_placecrop] run function crossbow_cartridges:crops/crop_item

#kill arrow
kill @s
