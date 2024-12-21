
execute store result score $giantsbane_damage gm4_aa_data run attribute @s minecraft:max_health get 100
scoreboard players operation $giantsbane_damage gm4_aa_data *= $augment.giantsbane_damage gm4_aa_data
scoreboard players operation $giantsbane_damage gm4_aa_data /= #100 gm4_aa_data

# sound and particles
execute at @s run particle block{block_state:"chest"} ~ ~1 ~ 0.3 0.3 0.3 0.5 12
playsound minecraft:entity.zombie.attack_wooden_door player @a ~ ~ ~ 1 0

# use custom system for player
execute if entity @s[type=player] run function gm4_augmented_armor:armor/augment/type/giantsbane/player_target/damage

# calcualte new health for non-player
execute store result score $health gm4_aa_data run data get entity @s Health 100
scoreboard players operation $health gm4_aa_data -= $giantsbane_damage gm4_aa_data
# if health is reduced to 0 kill this entity
execute unless score $health gm4_aa_data matches 1.. run damage @s 9999 mob_attack by @p[tag=gm4_aa_augment_damager]
# otherwise reduce health to new total
execute store result entity @s[type=!player] Health float 0.01 run scoreboard players get $health gm4_aa_data
