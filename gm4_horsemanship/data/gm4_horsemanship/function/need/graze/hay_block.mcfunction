# process (gm4_)horses that completed grazing a hay block
# @s = (gm4_)horse
# at @s
# run from need/graze/complete

# if this is a gm4_horse fill its grazing need to 1050
execute if entity @s[tag=gm4_horse.tamed] run scoreboard players set @s[scores={gm4_horse_need.graze=..1049}] gm4_horse_need.graze 1050

# particles and sound
playsound minecraft:block.grass.break block @a ~ ~ ~ 1 1
particle block{block_state:"hay_block"} ~ ~ ~ 0.2 0.05 0.2 0 4
