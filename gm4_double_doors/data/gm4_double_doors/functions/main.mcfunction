execute as @a[scores={gm4_double_doors_auto_toggle_settings_trigger=1..}] run function gm4_double_doors:toggle_auto_setting
scoreboard players enable @a gm4_double_doors_auto_toggle_settings_trigger

schedule function gm4_double_doors:main 20t
