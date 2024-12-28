def make-base16-theme [color_scheme: record] {
  # for $x in 0..16 { $x | into binary | encode hex |str substring --utf-8-bytes 0..1 | into string |"let \$base" + $in + " = \$color_scheme.base" + $in   | print}
  let $base00 = $color_scheme.base00
  let $base01 = $color_scheme.base01
  let $base02 = $color_scheme.base02
  let $base03 = $color_scheme.base03
  let $base04 = $color_scheme.base04
  let $base05 = $color_scheme.base05
  let $base06 = $color_scheme.base06
  let $base07 = $color_scheme.base07
  let $base08 = $color_scheme.base08
  let $base09 = $color_scheme.base09
  let $base0a = $color_scheme.base0A
  let $base0b = $color_scheme.base0B
  let $base0c = $color_scheme.base0C
  let $base0d = $color_scheme.base0D
  let $base0e = $color_scheme.base0E
  let $base0f = $color_scheme.base0F
  {
    separator: $base03
    leading_trailing_space_bg: $base04
    header: $base0b
    date: $base0e
    filesize: $base0d
    row_index: $base0c
    bool: $base08
    int: $base0b
    duration: $base08
    range: $base08
    float: $base08
    string: $base04
    nothing: $base08
    binary: $base08
    cellpath: $base08
    hints: dark_gray

    # shape_garbage: { fg: $base07 bg: $base08 attr: b} # base16 white on red
    # but i like the regular white on red for parse errors
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
    shape_bool: $base0d
    shape_int: { fg: $base0e attr: b}
    shape_float: { fg: $base0e attr: b}
    shape_range: { fg: $base0a attr: b}
    shape_internalcall: { fg: $base0c attr: b}
    shape_external: $base0c
    shape_externalarg: { fg: $base0b attr: b}
    shape_literal: $base0d
    shape_operator: $base0a
    shape_signature: { fg: $base0b attr: b}
    shape_string: $base0b
    shape_filepath: $base0d
    shape_globpattern: { fg: $base0d attr: b}
    shape_variable: $base0e
    shape_flag: { fg: $base0d attr: b}
    shape_custom: {attr: b}
}}


$env.config.color_config = (make-base16-theme $color_scheme_record)

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
$env.config.recursion_limit = 2000




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


#~/.config/nushell/config.n
source ~/.cache/carapace/init.nu

# $env.config.hooks.pre_prompt = { ||
#     if (pwd|[$in, 'shell.nix']|path join | path exists) {
#       if (env | find IN_NIX_SHELL | is-empty) {
#         exec nix-shell  
#       }
#     }
# }

