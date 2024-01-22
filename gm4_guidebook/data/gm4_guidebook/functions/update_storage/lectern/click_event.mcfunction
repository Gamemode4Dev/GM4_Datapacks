import json
# search tree to build the line with the proper click event
# @s = none
# located at world spawn
# run from gm4_guidebook:update_storage/lectern/build_line

### NOTE: This can be optimized by using a search tree only at the beginning, 
### since each subsequent search is linear and just one higher than the last


for node in generate_tree(range(500),name="" , key=int, root=("gm4_guidebook:update_storage/lectern/click_event")):
    append function node.parent:
        if node.partition(4):
            execute if score $click gm4_guide_pages matches node.range run function node.children
        else:
            page = {
                "nbt": "lectern_pages[0][0]",
                "storage": "gm4_guidebook:temp",
                "color":"#4AA0C7",
                "clickEvent":{"action":"change_page","value":f"{node.value}"},
                "hoverEvent":{"action":"show_text","contents":[{"translate":"text.gm4.guidebook.jump_to_section","fallback":"Jump to Section","color":"gold"}]}
              }
            execute if score $click gm4_guide_pages matches node.value run data modify block 29999998 1 7133 front_text.messages[0] set value json.dumps(page,separators=(',',':'))
