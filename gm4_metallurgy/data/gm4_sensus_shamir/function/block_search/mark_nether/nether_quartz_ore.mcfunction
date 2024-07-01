# @s = none, run by command blocks placed during block_search/search.mcfunction on nether_quartz_ore
# at command_block location

# locate ores and play sound
playsound entity.zombie.attack_iron_door block @a[tag=gm4_has_sensus,distance=..8] ~ ~ ~ 0.05 0.9
setblock ~ ~ ~ nether_quartz_ore
