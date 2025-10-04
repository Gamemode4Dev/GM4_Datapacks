# @s = punched gm4_llp_candle_rcd interaction
# at @s
# run from mechanics/attacks/placement/hit_rcd

# store time to check
execute store result score $gametime gm4_llp.data run time query gametime
execute store result score $check_gametime gm4_llp.data run data get entity @s attack.timestamp 1

# clean
data remove entity @s attack

# fail if old attack
execute unless score $gametime gm4_llp.data = $check_gametime gm4_llp.data run return fail

# kill placement rcd
kill @s

# if survival, break lily pad with item
execute unless score $creative gm4_llp.data matches 1 run return run setblock ~ ~ ~ air destroy

# if creative
setblock ~ ~ ~ air
scoreboard players reset $creative gm4_llp.data
playsound minecraft:block.big_dripleaf.break block @a[distance=..16] ~ ~ ~
