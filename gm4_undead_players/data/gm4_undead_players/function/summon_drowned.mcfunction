#run from gm4_undead_players:process_drowning
#@s = undead player who is being converted into a drowned

# Copy the zombie's NBT to storage, then kill the zombie instantly and without drops.
data modify storage gm4_undead_players:temp zombie_data set from entity @s
teleport @s ~ -10000 ~
data merge entity @s {Health:0f,DeathTime:19s}

# Summon the drowned and initialize it based on the contents of storage. 
summon drowned ~ ~ ~ {Tags:["gm4_undead_player","gm4_undead_player_new"],PersistenceRequired:1b,CustomNameVisible:1b,drop_chances:{mainhand:1F,offhand:1F,feet:1F,legs:1F,chest:1F,head:1F}}
execute as @e[type=drowned,tag=gm4_undead_player_new,distance=0,limit=1] run function gm4_undead_players:init_drowned

# Clear storage to avoid deep comparison when this function is next called.
data remove storage gm4_undead_players:temp zombie_data
