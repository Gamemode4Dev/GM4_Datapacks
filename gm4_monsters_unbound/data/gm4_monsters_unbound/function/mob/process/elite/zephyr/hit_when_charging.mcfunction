
execute anchored eyes positioned ^ ^-0.15 ^ run particle small_gust ~ ~ ~ 0.45 0.45 0.45 1 16 normal
playsound minecraft:entity.breeze.hurt hostile @a ~ ~ ~ 1 0
effect give @s slowness 1 9 true

attribute @s generic.movement_speed modifier remove gm4_monsters_unbound:elite_buff.speed.charging
attribute @s generic.movement_speed modifier remove gm4_monsters_unbound:elite_buff.speed.charged
attribute @s generic.attack_damage modifier remove gm4_monsters_unbound:elite_buff.speed.charged
scoreboard players reset @s gm4_mu_timer

summon breeze_wind_charge ~ ~ ~ {Motion:[0.0,-5.0,0.0]}

# disable charge for a little time
tag @s remove gm4_mu_elite.zephyr_skeleton_burst
tag @s remove gm4_mu_charging_attack
tag @s remove gm4_mu_elite.on_hit
scoreboard players set @s gm4_mu_timer -4
