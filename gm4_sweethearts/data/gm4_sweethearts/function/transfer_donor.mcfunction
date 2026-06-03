# @s = sneaking player donating health
# at @s
# run from transfer_recipient

# turn off death messages for potential death
execute store result score $deathmessage gm4_sh_data run gamerule show_death_messages
gamerule show_death_messages false

# damage player
damage @s 1 magic by @s

# handle death (@e only selects entities which are alive)
execute at @s unless entity @e[type=player,tag=gm4_sh_donor,distance=0,limit=1] run function gm4_sweethearts:kill_donor

# re-enable death messages
execute if score $deathmessage gm4_sh_data matches 1 run gamerule show_death_messages true
scoreboard players reset $deathmessage gm4_sh_data

# visuals
particle damage_indicator ~ ~2 ~ 0 0 0 .255 5
playsound minecraft:entity.player.hurt player @a[distance=..8] ~ ~ ~ 1 1
