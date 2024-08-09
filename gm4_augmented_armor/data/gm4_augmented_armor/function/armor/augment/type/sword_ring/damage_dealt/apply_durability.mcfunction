# damage armor durability
# @s = sword item_display
# at player rotated ~x ~
# run from armor/augment/type/sword_ring/damage_dealt/durability

# add incoming damage to the current damage
scoreboard players operation $sword_damage gm4_aa_data += $incoming_damage gm4_aa_data
execute store result storage gm4_augmented_armor:temp damage int 1 run scoreboard players operation $sword_damage gm4_aa_data < $sword_durability gm4_aa_data

# apply to correct piece of armor
execute as @p[tag=gm4_aa_target] run function gm4_augmented_armor:item_modify_eval/set_damage with storage gm4_augmented_armor:temp
execute as @p[tag=gm4_aa_target] run function gm4_augmented_armor:armor/slot/silence_equip_sound

# effect in case sword broke
execute if score $sword_damage gm4_aa_data = $sword_durability gm4_aa_data run playsound entity.item.break player @p[tag=gm4_aa_target] ~ ~ ~ 1 1

# cleanup
data remove storage gm4_augmented_armor:temp damage
