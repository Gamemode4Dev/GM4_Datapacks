# @s = any player who has hit an entity and has the freezing pneuma
# run from advancement "trigers/freeze_attack"

advancement revoke @s only gm4_orb_of_ankou:triggers/freeze_attack
execute positioned ^ ^ ^2 run effect give @e[distance=..2.5,tag=!smithed.strict,nbt={HurtTime:10s}] slowness 30 0
