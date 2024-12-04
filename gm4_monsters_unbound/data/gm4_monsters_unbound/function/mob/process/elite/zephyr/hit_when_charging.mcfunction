# remove charge if mob is hit
# @s = zephyr elite
# at @s
# run from mob/process/elite/on_hit/check_mob

execute anchored eyes positioned ^ ^-0.15 ^ run particle small_gust ~ ~ ~ 0.45 0.45 0.45 1 16 normal
playsound minecraft:entity.breeze.hurt hostile @a ~ ~ ~ 1 0
effect give @s slowness 1 9 true

attribute @s movement_speed modifier remove gm4_monsters_unbound:elite_buff.speed.charging
attribute @s movement_speed modifier remove gm4_monsters_unbound:elite_buff.speed.charged
attribute @s attack_damage modifier remove gm4_monsters_unbound:elite_buff.speed.charged
attribute @s attack_knockback modifier remove gm4_monsters_unbound:elite_buff.speed.charged

execute if score @s gm4_mu_timer matches 2.. run summon breeze_wind_charge ~ ~ ~ {Motion:[0.0,-5.0,0.0]}

# disable charge for a little time
tag @s remove gm4_mu_elite.zephyr_skeleton_burst
tag @s remove gm4_mu_charging_attack
tag @s remove gm4_mu_elite.on_hit
scoreboard players set @s gm4_mu_timer -4
