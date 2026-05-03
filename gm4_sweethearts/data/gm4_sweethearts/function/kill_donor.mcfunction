# @s = sneaking player donating health
# at @s
# run from transfer_donor

advancement grant @s only gm4:sweethearts
execute if score $deathmessage gm4_sh_data matches 1 run tellraw @a [{"text":"","color":"white"},{"selector":"@s"},{"text":" was shot through the heart and "},{"selector":"@p[tag=gm4_sh_recipient]"},{"text":" was to blame"}]
