# mark wolf as having been checked, wolf will not despawn until next check
# @s = wolf that belonged to the armor piece
# at unspecified
# run from armor/type/canine/check

execute if score $wolf gm4_aa_data matches 0 run scoreboard players set @s gm4_aa_augment.canine.timer 1
scoreboard players set $wolf gm4_aa_data 1
