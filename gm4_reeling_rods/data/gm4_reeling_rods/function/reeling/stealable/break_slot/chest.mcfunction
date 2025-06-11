# Break Chest Slot
# @s = #gm4_reeling_rods:steal_equipment
# at bobber in @s
# run from reeling/stealable/steal_slot/chest

item replace entity @s armor.chest with minecraft:air
playsound minecraft:entity.item.break neutral @a[distance=..16] ~ ~ ~
return fail
