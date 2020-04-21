require('telescope').setup {
  extensions = {
    bookmarks = {
      -- Available:
      --  * 'brave'
      --  * 'buku'
      --  * 'chrome'
      --  * 'chrome_beta'
      --  * 'edge'
      --  * 'firefox'
      --  * 'qutebrowser'
      --  * 'safari'
      --  * 'vivaldi'
      --  * 'waterfox'
      selected_browser = 'chrome',

      -- Either provide a shell command to open the URL
      -- url_open_command = 'open',

      -- Or provide the plugin name which is already installed
      -- Available: 'vim_external', 'open_browser'
      url_open_plugin = 'open_browser',

      -- Show the full path to the bookmark instead of just the bookmark name
      full_path = true,

      -- Provide a custom profile name for Firefox browser
      firefox_profile_name = nil,

      -- Provide a custom profile name for Waterfox browser
      waterfox_profile_name = nil,

      -- Add a column which contains the tags for each bookmark for buku
      buku_include_tags = false,

      -- Provide debug messages
      debug = false,
    },
  }
}
require('telescope').load_extension('bookmarks')

