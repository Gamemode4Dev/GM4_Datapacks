# calculate modifiers for newly spawned slime / magma cube
# @s = slime / magma cube
# at @s
# run from mob/init/mob_type

# starting stats (easy/normal/hard)
# health: 16/4/1 (depending on size)
# damage slime: 2/2/3 (depending on size)
# damage magma cube: 3/4/6 (depending on size)

# store size for changing
execute store result score $size gm4_sr_data run data get entity @s Size

# base stat nerf
execute unless score $size gm4_sr_data matches 0 run attribute @s generic.max_health modifier add gm4_survival_refightalized:stat_change.base_nerf -3 add_value

# max stat buffs
scoreboard players set $mob_health gm4_sr_data 13
scoreboard players set $mob_damage gm4_sr_data 0
scoreboard players set $mob_speed gm4_sr_data 0

# size changes based on difficulty
execute if score $size gm4_sr_data matches 1..3 if predicate gm4_survival_refightalized:technical/chance/slime_grow_common run scoreboard players add $size gm4_sr_data 1
execute if score $size gm4_sr_data matches 1..3 if predicate gm4_survival_refightalized:technical/chance/slime_grow_rare run scoreboard players add $size gm4_sr_data 1

# store a tag to set size later
tag @s add gm4_sr_set_slime_size
