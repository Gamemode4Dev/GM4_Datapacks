# @s = any player who has hit an entity and has the venomous pneuma
# run from advancement "trigers/poison_attack"

advancement revoke @s only gm4_orb_of_ankou:triggers/poison_attack
execute positioned ^ ^ ^2 run effect give @e[distance=..2.5,tag=!smithed.strict,nbt={HurtTime:10s}] poison 7 0
