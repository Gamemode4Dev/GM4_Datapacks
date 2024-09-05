# @s = any player who has hit an entity and has the withering pneuma
# run from advancement "trigers/wither_attack"

advancement revoke @s only gm4_orb_of_ankou:triggers/wither_attack
execute positioned ^ ^ ^2 run effect give @e[distance=..2.5,tag=!smithed.strict,nbt={HurtTime:10s}] wither 8 1
