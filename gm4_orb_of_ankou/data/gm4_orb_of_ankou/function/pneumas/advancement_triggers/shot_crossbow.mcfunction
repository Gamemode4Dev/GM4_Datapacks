# @s = any player who has shot a crossbow
# run from advancement "trigers/shoot_crossbow"

advancement revoke @s only gm4_orb_of_ankou:triggers/shoot_crossbow
execute if entity @s[tag=gm4_pneuma_blasting,nbt={Inventory:[{id:"minecraft:blaze_powder"}]}] run function gm4_orb_of_ankou:pneumas/blasting
