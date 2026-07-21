-- Cedar filetype detection.
-- Require this from init.lua:  require("ft.cedar")
--
-- Note: pattern entries are evaluated before extension entries, so the JSON
-- schema and entity files resolve to json rather than cedarschema.

vim.filetype.add({
  pattern = {
    [".*%.cedarschema%.json"] = "json",
    [".*%.cedar%.json"] = "json",
    [".*%.entities%.json"] = "json",
  },
  extension = {
    cedar = "cedar",
    cedarschema = "cedarschema",
  },
})
