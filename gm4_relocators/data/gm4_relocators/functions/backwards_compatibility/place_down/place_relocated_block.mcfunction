# @s = player who placed a relocated block player head
# run from advancement "place_relocated_block"

advancement revoke @s only gm4_relocators:backwards_compatibility/place_relocated_block

# store item into armor stand
execute positioned ~ ~-5 ~ run kill @e[type=armor_stand,tag=gm4_relocator_fill,dy=13]
summon armor_stand ~ ~ ~ {Invisible:1b,Marker:1b,NoGravity:1b,Small:1b,CustomName:'"gm4_relocator_fill"',Tags:["gm4_relocator_fill"]}
tp @e[type=armor_stand,limit=1,tag=gm4_relocator_fill,distance=..0.001] ~ ~ ~ ~ 0
execute align y run tp @e[type=armor_stand,limit=1,tag=gm4_relocator_fill,distance=..0.001] ~ ~ ~
data modify entity @e[type=armor_stand,limit=1,tag=gm4_relocator_fill,distance=..0.001] ArmorItems[0] set from entity @s SelectedItem

# check for relocated block heads
execute as @e[type=armor_stand,tag=gm4_relocator_fill,limit=1,sort=nearest,distance=..0.001] at @s run function gm4_relocators:backwards_compatibility/place_down/find_head

# return relocator
loot spawn ~ ~.3 ~ loot gm4_relocators:items/relocator_empty
data merge entity @e[type=item,distance=..1,nbt={Age:0s,Item:{tag:{gm4_relocator:1b}}},limit=1] {PickupDelay:0}
