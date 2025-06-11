# Break Head Slot
# @s = #gm4_reeling_rods:steal_equipment
# at bobber in @s
# run from reeling/stealable/steal_slot/Head

item replace entity @s armor.head with minecraft:air
playsound minecraft:entity.item.break neutral @a[distance=..16] ~ ~ ~
return fail
