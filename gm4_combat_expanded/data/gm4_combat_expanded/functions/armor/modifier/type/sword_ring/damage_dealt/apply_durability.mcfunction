# damage armor durability
# @s = sword item_display
# at player rotated ~x ~
# run from armor/modifier/type/sword_ring/damage_dealt/durability

# add incoming damage to the current damage
execute store result storage gm4_combat_expanded:temp damage int 1 run scoreboard players operation $sword_damage gm4_ce_data += $incoming_damage gm4_ce_data
scoreboard players operation $sword_damage gm4_ce_data < $sword_durability gm4_ce_data

# apply to correct piece of armor
execute if score $sword_id gm4_ce_data matches 0 run item modify entity @p[tag=gm4_ce_target] armor.head gm4_combat_expanded:set_damage
execute if score $sword_id gm4_ce_data matches 1 run item modify entity @p[tag=gm4_ce_target] armor.chest gm4_combat_expanded:set_damage
execute if score $sword_id gm4_ce_data matches 2 run item modify entity @p[tag=gm4_ce_target] armor.legs gm4_combat_expanded:set_damage
execute if score $sword_id gm4_ce_data matches 3 run item modify entity @p[tag=gm4_ce_target] armor.feet gm4_combat_expanded:set_damage
execute as @p[tag=gm4_ce_target] run function gm4_combat_expanded:armor/slot/silence_equip_sound

# effect in case sword broke
execute if score $sword_damage gm4_ce_data = $sword_durability gm4_ce_data run playsound entity.item.break player @p[tag=gm4_ce_target] ~ ~ ~ 1 1

# cleanup
data remove storage gm4_combat_expanded:temp damage
