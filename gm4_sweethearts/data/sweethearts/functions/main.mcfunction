execute as @a[scores={gm4_sh_sneak=1..},nbt={SelectedItem:{id:"minecraft:poppy"}}] at @s run function sweethearts:sneaking

scoreboard players set @a[scores={gm4_sh_sneak=1..}] gm4_sh_sneak 0
