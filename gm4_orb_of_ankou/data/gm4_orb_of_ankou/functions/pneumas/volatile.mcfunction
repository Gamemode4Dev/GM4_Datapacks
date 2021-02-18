#@s = player with volatile pneuma who has been damaged
#run from advancement_triggers/player_damaged

execute store result score @s gm4_pneuma_data run data get entity @s Health
execute as @e[type=item,distance=..5,tag=!gm4_oa_invulnerable,nbt=!{Invulnerable:1b}] run data merge entity @s {Invulnerable:1b}
tag @e[type=item,distance=..5] add gm4_oa_invulnerable
execute unless entity @a[distance=..6,predicate=gm4_metallurgy:defuse_active] if score @s[gamemode=!adventure] gm4_pneuma_data matches ..3 run summon creeper ~ ~ ~ {ExplosionRadius:1b,ignited:1b,Fuse:0s,CustomName:'"Volatile Player"'}
