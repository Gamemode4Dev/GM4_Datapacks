data merge block ~ ~ ~ {CustomName:'{"translate":"gm4.second","fallback":"%1$s","with":[{"translate":"container.gm4.zauber_tank.wormhole","fallback":"Wormhole Tank"},[{"translate":"gui.gm4.liquid_tank","fallback":"","font":"gm4:container_gui","color":"white"},{"translate":"container.gm4.zauber_tank.wormhole","fallback":"Wormhole Tank","font":"gm4:default","color":"#404040"}]]}'}
summon armor_stand ~ ~-.95 ~ {CustomName:'"gm4_liquid_tank_display"',Tags:["gm4_no_edit","gm4_liquid_tank_display","smithed.entity","smithed.strict"],NoGravity:1,Marker:1,Invisible:1,Invulnerable:1,Small:1,Silent:1,DisabledSlots:4144959,HasVisualFire:1,ArmorItems:[{},{},{},{id:"player_head",Count:1b,tag:{SkullOwner:{Id:[I;-1903127985,893928782,-1710128554,467590157],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvODQ5M2Q5OTRlODBmOTc0NWNiZWFiYWMwN2VkYmE2MTk5YTgyNGM3YTJhYTJjNDI1MjhkMDNkMzAzYzVhN2M5YSJ9fX0="}]}}}}]}
data modify entity @s data.gm4_liquid_tanks.liquid_tag set value "gm4_lt_zauber_wormhole_potion"
scoreboard players set @s gm4_lt_max 300
tag @s add gm4_lt_zauber_wormhole_potion
tag @s add gm4_volatile_liquid
tag @s remove gm4_lt_empty
