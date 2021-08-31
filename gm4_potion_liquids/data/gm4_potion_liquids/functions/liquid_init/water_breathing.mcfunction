data merge block ~ ~ ~ {CustomName:'{"translate":"%1$s%3427655$s","with":["Water Breathing Potion Tank", {"translate":"block.gm4.liquid_tank.water_breathing"}]}'}
summon armor_stand ~ ~-.45 ~ {CustomName:"\"gm4_liquid_tank_display\"",Tags:["gm4_no_edit","gm4_liquid_tank_display"],NoGravity:1,Marker:1,Silent:1,Invisible:1,Invulnerable:1,Small:1,DisabledSlots:2039552,HasVisualFire:1,ArmorItems:[{},{},{},{id:"player_head",Count:1b,tag:{SkullOwner:{Id:[I;2130271109,-1138624001,-1614258018,-889714317],Properties:{textures:[{Value:"eyJ0aW1lc3RhbXAiOjE0MjkzNDc2OTI3OTMsInByb2ZpbGVJZCI6IjYzY2JkZjhkNDg4OTQ3NWY5NDQxMjk3ZTRhM2Q1NjczIiwicHJvZmlsZU5hbWUiOiJWZWxlVCIsImlzUHVibGljIjp0cnVlLCJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvNDc3YTdjMjEzNjc3NWE0ZWI0ZGUzMWU3MTViZWM2Y2M2NTdhN2Q2NmI0OGEzYmE1MjczMzI5MmM2ZTMyMmZhZSJ9fX0="}]}}}}]}
data modify entity @s ArmorItems[3].tag.gm4_liquid_tanks.liquid_tag set value "gm4_lt_water_breathing"
scoreboard players set @s gm4_lt_max 300
tag @s add gm4_lt_water_breathing
tag @s remove gm4_lt_empty
