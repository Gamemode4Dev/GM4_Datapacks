# Break Mainhand Slot
# @s = #gm4_reeling_rods:steal_hand or #gm4_reeling_rods:steal_equipment
# at bobber in @s
# run from reeling/stealable/steal_slot/mainhand

item replace entity @s weapon.mainhand with minecraft:air
playsound minecraft:entity.item.break neutral @a[distance=..16] ~ ~ ~
return fail
