# @s = any player who has hit an entity and has the depriving pneuma
# run from advancement "trigers/hunger_attack"

advancement revoke @s only gm4_orb_of_ankou:triggers/hunger_attack
execute positioned ^ ^ ^2 run effect give @a[distance=..2.5,nbt={HurtTime:10s}] hunger 7 0
execute positioned ^ ^ ^2 run effect give @e[type=!player,tag=!smithed.strict,distance=..2.5,nbt={HurtTime:10s}] weakness 7 0
