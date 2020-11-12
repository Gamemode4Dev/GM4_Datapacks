# @s = command block placed by "gm4_relocators:place_down/replace_head"
# located at the command block (where the player head was)

setblock ~ ~ ~ lodestone

summon armor_stand ~ ~-.4 ~ {Small:1,NoGravity:1,Marker:1,Invulnerable:1,Invisible:1,DisabledSlots:2039552,Tags:["gm4_no_edit","gm4_teleportation_anchor"],Fire:200000,CustomName:'"gm4_teleportation_anchor"',ArmorItems:[{},{},{},{id:end_portal_frame,Count:1b,tag:{CustomModelData:1}}]}
playsound minecraft:block.end_portal.spawn block @a[distance=..8] ~ ~ ~ 0.3 1.8
