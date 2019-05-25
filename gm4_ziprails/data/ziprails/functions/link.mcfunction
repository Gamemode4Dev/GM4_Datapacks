#This function docks minecarts under hooks to assign them a zipline movement direction.
#Handles initial docking.

#@s = @e[type=#gm4:minecarts] at @s if block ~ ~1 ~ tripwire_hook[attached=true]

tag @s add gm4_linked
#execute align y run teleport @s ~ ~0.36250001192093 ~

#remove old facing directions
tag @s remove gm4_zipping_north
tag @s remove gm4_zipping_south
tag @s remove gm4_zipping_east
tag @s remove gm4_zipping_west

#assign minecart movement direction based on the direction of the hook above them
execute if block ~ ~1 ~ tripwire_hook[facing=north] run tag @s add gm4_zipping_north
execute if block ~ ~1 ~ tripwire_hook[facing=south] run tag @s add gm4_zipping_south
execute if block ~ ~1 ~ tripwire_hook[facing=east] run tag @s add gm4_zipping_east
execute if block ~ ~1 ~ tripwire_hook[facing=west] run tag @s add gm4_zipping_west

#sound effect
playsound minecraft:entity.item_frame.place neutral @p[distance=..1,limit=1]
