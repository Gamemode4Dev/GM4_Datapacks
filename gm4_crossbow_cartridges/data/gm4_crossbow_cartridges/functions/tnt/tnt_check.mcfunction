#run from arrow_in_ground
# @s = @e[type=minecraft:arrow,tag=gm4_cb_tnt,nbt={inGround:1b}]
# at @s

#summon tnt if loop is ended
execute unless block ~ ~ ~ #gm4:full_collision run summon tnt

#kill arrow
kill @s

