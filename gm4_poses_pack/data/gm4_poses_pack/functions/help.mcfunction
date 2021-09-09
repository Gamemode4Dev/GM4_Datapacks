# @s = armor_stand
# at @s
# run from apply_book

tellraw @p[tag=gm4_bas_active] [{"text":"● Pose Presets: ","color":"gray"},{"text":"[Head]","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"Set the head pose of the armour stand:\n▶ head up\n▶ head down\n▶ head right\n▶ head left"}]}},{"text":", ","color":"gray"},{"text":"[Arms]","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"Set the arms pose of the armour stand:\n▶ arms down\n▶ arms swinging\n▶ arms raised\n▶ arms reaching\n▶ arms resting"}]}},{"text":", ","color":"gray"},{"text":"[Legs]","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"Set the legs pose of the armour stand:\n▶ legs down\n▶ legs sitting\n▶ legs walking\n▶ legs flying"}]}}]
