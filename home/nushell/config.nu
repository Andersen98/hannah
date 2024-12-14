# ------------------------
# History-related settings
# ------------------------
# $env.config.history.*
$env.config.history.file_format = "sqlite"
$env.config.history.max_size = 5_000_000
$env.config.history.isolation = false


# ----------------------
# Miscellaneous Settings
# ----------------------
$env.config.show_banner = true
$env.config.rm.always_trash = true
$env.config.recursion_limit = 50


# ---------------------------
# Commandline Editor Settings
# ---------------------------
edit_mode: "vi"
buffer_editor: "editor"
$env.config.cursor_shape.vi_insert = "line" 
$env.config.cursor_shape.vi_normal = "blink_block"


# --------------------
# Completions Behavior
# --------------------
# $env.config.completions.*
# Apply to the Nushell completion system

$env.config.completions.algorithm = "fuzzy"
$env.config.completions.sort = "smart"
$env.config.completions.case_sensitive = false
$env.config.completions.quick = true # auto-select when 1 remains
$env.config.completions.partial = true
$env.config.completions.use_ls_colors = true


