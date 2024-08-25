# summon new zombie/husk/drowned when spore is grown
# @s = spore item
# at @s
# run from mob/process/spore/advance

# check for mob cap
execute at @p[gamemode=!spectator] store result score $spore_zombie_count gm4_mu_data if entity @e[type=#gm4_survival_refightalized:zombie_types,tag=gm4_mu_spore_mob,distance=..32]
execute if score $spore_zombie_count gm4_mu_data > $mob_limit.spore_zombie gm4_mu_data run kill @s
execute if score $spore_zombie_count gm4_mu_data > $mob_limit.spore_zombie gm4_mu_data run return 0

# get spores in stack and their generation
execute store result score $spore_count gm4_mu_data run data get entity @s Item.count
execute store result score $generation gm4_mu_data run data get entity @s Item.components."minecraft:custom_data".gm4_mu_spore.generation

# spawn up to 4 spore zombies
execute align xz run summon zombie ~.5 ~ ~.5 {Tags:["gm4_sr_extra_mob","gm4_mu_spore_mob"]}
execute if score $spore_count gm4_mu_data matches 2.. align xz run summon zombie ~.51 ~ ~.47 {Tags:["gm4_sr_extra_mob","gm4_mu_spore_mob"]}
execute if score $spore_count gm4_mu_data matches 3.. align xz run summon zombie ~.54 ~ ~.52 {Tags:["gm4_sr_extra_mob","gm4_mu_spore_mob"]}
execute if score $spore_count gm4_mu_data matches 4.. align xz run summon zombie ~0.47 ~ ~.54 {Tags:["gm4_sr_extra_mob","gm4_mu_spore_mob"]}
execute if entity @s[tag=gm4_mu_spore.cherry] run tag @e[type=zombie,tag=gm4_mu_spore_mob,distance=..1] add gm4_mu_spore_zombie.cherry

# vfx
particle minecraft:block{block_state:"minecraft:flowering_azalea_leaves"} ~ ~1 ~ 0.35 1 0.35 0.1 32
playsound block.grass.break hostile @a ~ ~ ~ 0.6 0.6

# remove spores
execute if score $spore_count gm4_mu_data matches ..4 run kill @s
execute if score $spore_count gm4_mu_data matches 5.. store result entity @s Item.count byte 1 run scoreboard players remove $spore_count gm4_mu_data 4

# set spore zombie generation
execute as @e[tag=gm4_mu_spore_mob,distance=..1] at @s run function gm4_monsters_unbound:mob/process/spore/set_generation
