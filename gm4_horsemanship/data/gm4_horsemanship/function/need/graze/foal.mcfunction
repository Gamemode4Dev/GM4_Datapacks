
# reduce remaining Age by 10%
execute store result score $age gm4_horse_data run data get entity @s Age
execute store result entity @s Age int 0.9 run scoreboard players get $age gm4_horse_data
execute store result score $age_after gm4_horse_data run data get entity @s Age

# add skipped age*15 to potential to not lose out on any score there (plus a small bonus)
scoreboard players operation $age gm4_horse_data -= $age_after gm4_horse_data
scoreboard players operation $age gm4_horse_data *= #15 gm4_horse_data
scoreboard players operation $age gm4_horse_data /= #20 gm4_horse_data
scoreboard players operation @s gm4_horse_potential.foal -= $age gm4_horse_data

# add bonus to potential if this is the first graze of the foal
scoreboard players add @s[scores={gm4_horse_need.graze=1..}] gm4_horse_potential.foal 3000
scoreboard players remove @s[scores={gm4_horse_need.graze=1..}] gm4_horse_need.graze 1
