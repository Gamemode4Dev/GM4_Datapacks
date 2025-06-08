# process (gm4_)horses that completed grazing a hay block
# @s = (gm4_)horse
# at @s
# run from need/graze/complete

# set grazing to cap
scoreboard players operation @s[tag=gm4_horse] gm4_horse_need.graze = $need_cap.graze gm4_horse_data

# particles and sound
playsound minecraft:block.grass.break block @a ~ ~ ~ 1 1
particle block{block_state:"hay_block"} ~ ~ ~ 0.2 0.05 0.2 0 4
