data merge block ~ ~ ~ {CustomName:'{"translate":"%1$s","with":["Leaping Potion Tank", {"translate":"block.gm4.liquid_tank.leaping"}]}'}
summon armor_stand ~ ~-.45 ~ {CustomName:"\"gm4_liquid_tank_display\"",Tags:["gm4_no_edit","gm4_liquid_tank_display"],NoGravity:1,Marker:1,Invisible:1,Invulnerable:1,Small:1,DisabledSlots:2039552,Fire:20000,ArmorItems:[{},{},{},{id:"player_head",Count:1b,tag:{SkullOwner:{Id:7EF95B85-AC21-C9FF-9FC8-609ECAF80973,Properties:{textures:[{Value:"eyJ0aW1lc3RhbXAiOjE0MjkzNDY5NDYzMjksInByb2ZpbGVJZCI6IjZjZjU0M2E2MGVlOTQzN2NiNjE0YzdiOTRkZTVjNWI3IiwicHJvZmlsZU5hbWUiOiJNcnNNYWtpc3RlaW4iLCJpc1B1YmxpYyI6dHJ1ZSwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlL2RjMzE2NmFkZTk1NTA2Y2VmZDhjNTdiMWVlNWY4MTNiNTNhOWZjMTliYTEzNDhjYTE2NmE2YjBjZmEwMzAifX19"}]}}}}]}
scoreboard players set @s gm4_lt_max 300
tag @s add gm4_lt_leaping
tag @s remove gm4_lt_empty
