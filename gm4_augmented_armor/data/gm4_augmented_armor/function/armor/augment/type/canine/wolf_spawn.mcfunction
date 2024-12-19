# spawn wolf if there is none matching equipped armor
# @s = player to spawn the wolf
# at @s
# run from armor/type/canine/check

# first check cooldown and just tick down if it is not done
execute store result score $cooldown gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.augment.cooldown
execute if score $cooldown gm4_aa_data matches 1.. run return run function gm4_augmented_armor:armor/augment/type/canine/cooldown_tick

# obtain player UUID
data modify storage gm4_augmented_armor:temp uuid set from entity @s UUID

# BPR told me to add this ¯\_(ツ)_/¯ "stupid chunk loading stuff"
kill @e[type=wolf,tag=gm4_aa_new_wolf]
# spawn wolf
execute summon wolf run function gm4_augmented_armor:armor/augment/type/canine/wolf_initiate

# playsound with cooldown
execute unless score @s gm4_aa_augment.canine.timer matches 1.. run playsound minecraft:entity.wolf.whine neutral @s ~ ~ ~ 0.6 0.8
scoreboard players set @s gm4_aa_augment.canine.timer 1

# cleanup
data remove storage gm4_augmented_armor:temp uuid
