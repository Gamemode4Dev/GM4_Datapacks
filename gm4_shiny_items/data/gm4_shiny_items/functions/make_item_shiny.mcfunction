# Run from as_gm4_can_become_shiny
# @s = All items with a score of "gm4_absorbed_xp" that is equal or greater to the value needed for an item to become "Shiny"

data remove entity @s Item.tag.unstackable
data modify entity @s Item.tag.Enchantments set value [{id:"minecraft:lure",lvl:1s}]
data modify entity @s Item.tag.HideFlags set value 1

tag @s add gm4_shiny_blacklist
tag @s remove gm4_can_become_shiny

playsound minecraft:entity.experience_orb.pickup ambient @a[distance=..15] ~ ~ ~ .1 .5

advancement grant @a[distance=..10] only gm4:shiny_items

scoreboard players reset @s gm4_absorbed_xp

