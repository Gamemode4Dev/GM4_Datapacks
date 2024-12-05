# process entities with lightning charge
# @s = entity with a lightning charge
# at @s
# run from clocks/temp/lightning

# keep tick
scoreboard players set $keep_tick.sparking gm4_aa_keep_tick 1

# track striking timer
scoreboard players add @s[scores={gm4_aa_augment.sparking.striking_timer=1..}] gm4_aa_augment.sparking.striking_timer 1
execute unless score @s gm4_aa_augment.sparking.striking_timer matches 1.. run scoreboard players set @s[scores={gm4_aa_augment.sparking.static_stacks=21..}] gm4_aa_augment.sparking.striking_timer 1

# limit statoc charge to 21
scoreboard players set @s[scores={gm4_aa_augment.sparking.static_stacks=22..}] gm4_aa_augment.sparking.static_stacks 21

# display particles based on the amount of lightning charges a player has
scoreboard players operation @s gm4_aa_augment.sparking.deg += @s gm4_aa_augment.sparking.static_stacks
scoreboard players remove @s[scores={gm4_aa_augment.sparking.deg=360..}] gm4_aa_augment.sparking.deg 360
execute store result storage gm4_augmented_armor:temp lightning.deg int 1 run scoreboard players get @s gm4_aa_augment.sparking.deg

scoreboard players set $degree_per_particle gm4_aa_data 360
execute store result storage gm4_augmented_armor:temp lightning.deg_pp int 1 run scoreboard players operation $degree_per_particle gm4_aa_data /= @s gm4_aa_augment.sparking.static_stacks

scoreboard players operation $particles_to_display gm4_aa_data = @s gm4_aa_augment.sparking.static_stacks

execute store result storage gm4_augmented_armor:temp lightning.scale float 0.0075 run attribute @s scale get 100
execute store result storage gm4_augmented_armor:temp lightning.height float 0.0133 run attribute @s scale get 100

execute rotated 0 0 run function gm4_augmented_armor:armor/augment/type/sparking/particles/eval_rotation with storage gm4_augmented_armor:temp lightning

# check for full charge
execute if score @s gm4_aa_augment.sparking.striking_timer matches 1 run playsound minecraft:entity.lightning_bolt.thunder player @a ~ ~ ~ 1 0
execute if score @s gm4_aa_augment.sparking.striking_timer matches 1.. run particle electric_spark ~ ~10 ~ 0.1 4 0.1 0.2 16
execute if score @s gm4_aa_augment.sparking.striking_timer matches 45.. run function gm4_augmented_armor:armor/augment/type/sparking/strike

# reduce lightning charges if timer runs out
scoreboard players remove @s gm4_aa_augment.sparking.timer 1
scoreboard players remove @s[scores={gm4_aa_augment.sparking.timer=..0,gm4_aa_augment.sparking.static_stacks=..20}] gm4_aa_augment.sparking.static_stacks 1
scoreboard players set @s[scores={gm4_aa_augment.sparking.timer=..0}] gm4_aa_augment.sparking.timer 5

# cleanup
data remove storage gm4_augmented_armor:temp lightning
