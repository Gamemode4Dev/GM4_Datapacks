# @s = punched gm4_llp_candle_rcd interaction
# at @s
# run from mechanics/attacks/placement/hit_rcd

# clean
data remove entity @s attack

# fail if adventure
execute if score $adventure gm4_llp.data matches 1 run return run scoreboard players reset $adventure gm4_llp.data

# kill placement rcd
kill @s

# if survival, break lily pad with item
execute unless score $creative gm4_llp.data matches 1 run return run setblock ~ ~ ~ air destroy

# if creative
setblock ~ ~ ~ air
scoreboard players reset $creative gm4_llp.data
playsound minecraft:block.big_dripleaf.break block @a[distance=..16] ~ ~ ~
