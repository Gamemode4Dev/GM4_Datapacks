# @s = musical shamir cast if piston + jukebox align xyz positioned ~.5 ~-1 ~.5
# run from pulse_check

summon armor_stand ~ ~-.1 ~ {Small:1,NoGravity:1,Marker:1,Invulnerable:1,Invisible:1,DisabledSlots:2039552,Tags:["gm4_no_edit","gm4_magical_musical_jukebox"],Fire:200000,CustomName:'"gm4_magical_musical_jukebox"',ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{CustomModelData:1,SkullOwner:{Id:"1d045aa7-0bd9-422f-8783-2cbbd959f6d2",Properties:{textures:[{Value:"eyJ0aW1lc3RhbXAiOjE1NjI3Mzc1ODYxMTYsInByb2ZpbGVJZCI6IjNmYzdmZGY5Mzk2MzRjNDE5MTE5OWJhM2Y3Y2MzZmVkIiwicHJvZmlsZU5hbWUiOiJZZWxlaGEiLCJzaWduYXR1cmVSZXF1aXJlZCI6dHJ1ZSwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlLzJjYTQ5MGVlMDgyYjQ0N2MzZGUzNzc1MDBiYmEzNmVhOTNjZGRkZmQ0NzEzYTZkNDQ3MDE1NzkwYzFhNjMwNjEifX19"}]}}}}]}
kill @s
playsound minecraft:block.beacon.power_select block @a[distance=..5] ~ ~ ~ 1 2
particle cloud ~ ~1 ~ 0.1 0.1 0.1 0.05 10
advancement grant @a[distance=..5,gamemode=!spectator] only gm4:magical_musical_jukeboxes
