# get a random number
# @s = marker
# at unspecified
# run from weapon/chaos/random_effect

execute store result score $chaos_rng gm4_ce_data run data get entity @s UUID[0]
kill @s
