# add a timer for this player to be in pvp so they can be hit with certain augments
# @s = player damaging or being damaged by a player
# at @s
# run from advancement in_pvp

# if damaged a non-pvp player also activate damage dealt manually
execute if entity @s[advancements={gm4_augmented_armor:in_pvp={damage_pvp_player=true}},predicate=gm4_augmented_armor:modified_armor/generic_damage_dealt] run function gm4_augmented_armor:armor/trigger/damage_dealt

# revoke advancement
advancement revoke @s only gm4_augmented_armor:in_pvp

# set a pvp timer for 32 seconds
scoreboard players set @s gm4_aa_in_pvp 40
