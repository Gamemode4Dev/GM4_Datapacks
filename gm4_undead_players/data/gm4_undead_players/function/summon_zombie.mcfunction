#run from gm4_undead_players:died
#@s = player who has died and is not excluded from undead player spawning (via tag or gamemode)

# Summon zombie to be initialized.
summon zombie ~ ~1 ~ {CustomNameVisible:1,CanPickUpLoot:1b,PersistenceRequired:1b,Tags:["gm4_undead_player","gm4_undead_player_new"]}

# Use a loot table to extract the player's username.
loot replace entity @e[type=zombie,tag=gm4_undead_player_new,dy=2,limit=1] armor.head loot gm4_undead_players:player_head

# Run a function as the zombie to initialize its NBT.
execute as @e[type=zombie,tag=gm4_undead_player_new,dy=1,limit=1] run function gm4_undead_players:init_zombie

# Grant the "Risen" advancement to the player.
advancement grant @s only gm4:undead_players
