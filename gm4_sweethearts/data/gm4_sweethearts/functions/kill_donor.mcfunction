# @s = sneaking player donating health
# run from transfer_donor

execute store result score $deathmessage gm4_sh_data run gamerule showDeathMessages
gamerule showDeathMessages false
advancement grant @s only gm4:sweethearts
execute if score $deathmessage gm4_sh_data matches 1 run tellraw @a [{"text":"","color":"white"},{"selector":"@s"},{"text":" was shot through the heart and "},{"selector":"@p[tag=gm4_sh_recipient]"},{"text":" was to blame"}]
kill @s
execute if score $deathmessage gm4_sh_data matches 1 run gamerule showDeathMessages true
scoreboard players reset $deathmessage gm4_sh_data
