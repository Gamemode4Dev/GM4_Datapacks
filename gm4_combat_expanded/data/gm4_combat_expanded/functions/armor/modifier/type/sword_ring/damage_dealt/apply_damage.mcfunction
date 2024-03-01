# damage armor durability
# @s = sword item_display
# at player rotated ~x ~
# run from armor/modifier/type/sword_ring/damage_dealt/run

# add incoming damage to the current damage
execute store result score $current_damage gm4_ce_data run data get storage gm4_combat_expanded:temp sword_ring.data[0].tag.Damage
execute store result storage gm4_combat_expanded:temp damage int 1 run scoreboard players operation $current_damage gm4_ce_data += $incoming_damage gm4_ce_data

# apply to correct piece of armor
execute if score $sword_id gm4_ce_data matches 0 run item modify entity @p[tag=gm4_ce_target] armor.head gm4_combat_expanded:set_damage
execute if score $sword_id gm4_ce_data matches 1 run item modify entity @p[tag=gm4_ce_target] armor.chest gm4_combat_expanded:set_damage
execute if score $sword_id gm4_ce_data matches 2 run item modify entity @p[tag=gm4_ce_target] armor.legs gm4_combat_expanded:set_damage
execute if score $sword_id gm4_ce_data matches 3 run item modify entity @p[tag=gm4_ce_target] armor.feet gm4_combat_expanded:set_damage
function gm4_combat_expanded:armor/slot/silence_equip_sound

# cleanup
data remove storage gm4_combat_expanded:temp damage
