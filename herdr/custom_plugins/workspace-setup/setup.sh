#!/bin/sh  
ws="$HERDR_WORKSPACE_ID"  
HERDR="${HERDR_BIN_PATH:-herdr}"  
  
first_tab=$("$HERDR" workspace get "$ws" | jq -r .result.workspace.active_tab_id)  
"$HERDR" tab rename "$first_tab" shell  

new_tab() {  
  "$HERDR" tab create --workspace "$ws" --label "$1" --no-focus | jq -r .result.root_pane.pane_id  
}

# Keep the first_pane var so we can use it if we decide to run a command inside the first pane
first_pane=$("$HERDR" pane list --workspace "$ws" | jq -r '.result.panes[0].pane_id')  
# "$HERDR" pane run "$first_pane" "my-command"  
  
"$HERDR" pane run "$(new_tab ai)" "opencode"  
"$HERDR" pane run "$(new_tab nvim)" "nvim"  
"$HERDR" pane run "$(new_tab git)" "lazygit"  
  
