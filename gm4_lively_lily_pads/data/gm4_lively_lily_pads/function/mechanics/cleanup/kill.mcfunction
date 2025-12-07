# cleans up block display and drops item if needed
# @s = gm4_llp_display block_display
# at @s
# run from main and mechanics/attacks/perma/process_interaction

# delete light
execute if entity @s[tag=gm4_llp_light] run fill ~ ~1 ~ ~ ~1 ~ air replace light

# set up item data
data remove storage gm4_llp:temp item
data modify storage gm4_llp:temp item.id set from entity @s block_state.Name
data merge storage gm4_llp:temp {item:{count:1,motion:[0.0d,0.2d,0.0d]}}
execute if entity @s[tag=gm4_llp_candle] run data modify storage gm4_llp:temp item.count set from entity @s block_state.Properties.candles
execute store result storage gm4_llp:temp item.motion[0] double .01 run random value -10..10
execute store result storage gm4_llp:temp item.motion[2] double .01 run random value -10..10
# drop item unless a player in creative hit it
execute unless score $creative gm4_llp.data matches 1 run function gm4_lively_lily_pads:mechanics/cleanup/summon_item with storage gm4_llp:temp item

# break sound
execute if entity @s[tag=gm4_llp_candle] run playsound minecraft:block.candle.break block @a[distance=..16] ~ ~ ~
execute if entity @s[tag=gm4_llp_wood_sound] run playsound minecraft:block.wood.break block @a[distance=..16] ~ ~ ~
execute if entity @s[tag=gm4_llp_lantern_sound] run playsound minecraft:block.lantern.break block @a[distance=..16] ~ ~ ~
execute if entity @s[tag=gm4_llp_wet_grass_sound] run playsound minecraft:block.wet_grass.break block @a[distance=..16] ~ ~ ~
execute if entity @s[tag=gm4_llp_stone_sound] run playsound minecraft:block.stone.break block @a[distance=..16] ~ ~ ~
execute if entity @s[tag=gm4_llp_spore_blossom_sound] run playsound minecraft:block.spore_blossom.break block @a[distance=..16] ~ ~ ~
execute if entity @s[tag=gm4_llp_cactus_flower_sound] run playsound minecraft:block.cactus_flower.break block @a[distance=..16] ~ ~ ~

# kill entities
kill @e[type=minecraft:interaction,tag=gm4_llp_perma_rcd,limit=1,distance=..0.1]
kill @s
