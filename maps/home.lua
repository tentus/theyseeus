return {
  version = "1.1",
  luaversion = "5.1",
  tiledversion = "1.1.2",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 64,
  height = 48,
  tilewidth = 64,
  tileheight = 64,
  nextobjectid = 22,
  backgroundcolor = { 102, 153, 102 },
  properties = {},
  tilesets = {
    {
      name = "bg_tileset",
      firstgid = 1,
      filename = "bg_tileset.tsx",
      tilewidth = 64,
      tileheight = 64,
      spacing = 0,
      margin = 0,
      image = "../assets/tilesets/bg_tileset.png",
      imagewidth = 512,
      imageheight = 512,
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 64,
        height = 64
      },
      properties = {},
      terrains = {},
      tilecount = 64,
      tiles = {}
    },
    {
      name = "object_tileset",
      firstgid = 65,
      filename = "object_tileset.tsx",
      tilewidth = 64,
      tileheight = 64,
      spacing = 0,
      margin = 0,
      image = "../assets/tilesets/object_tileset.png",
      imagewidth = 512,
      imageheight = 512,
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 64,
        height = 64
      },
      properties = {},
      terrains = {},
      tilecount = 64,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      name = "bg",
      x = 0,
      y = 0,
      width = 64,
      height = 48,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
        10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
        10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
        10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
        10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
        10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
        10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
        10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
        10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
        10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 25, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 34, 34, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 27, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
        10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 34, 34, 42, 42, 42, 42, 42, 42, 42, 42, 42, 42, 42, 42, 42, 42, 42, 42, 42, 42, 42, 42, 42, 42, 42, 42, 42, 42, 42, 42, 42, 34, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
        10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
        10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
        10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
        10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
        10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
        10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
        10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
        10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
        26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 34, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
        42, 42, 42, 42, 42, 42, 42, 42, 42, 42, 42, 42, 42, 42, 42, 34, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
        10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
        10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
        10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
        10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
        10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
        10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
        10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 34, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26,
        10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 34, 42, 42, 42, 42, 42, 42, 42, 42, 42, 42, 42, 42, 42, 42, 42,
        10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 25, 27, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
        10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
        10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
        10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
        10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
        10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
        10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
        10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
        10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 34, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 34, 34, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 34, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
        10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 41, 42, 42, 42, 42, 42, 42, 42, 34, 34, 42, 42, 42, 42, 42, 42, 42, 42, 42, 42, 42, 42, 42, 42, 42, 42, 42, 42, 42, 42, 42, 42, 42, 43, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
        10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
        10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
        10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
        10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
        10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
        10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
        10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
        10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
        10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 33, 35, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10
      }
    },
    {
      type = "tilelayer",
      name = "static objects",
      x = 0,
      y = 0,
      width = 64,
      height = 48,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {
        ["collidable"] = true
      },
      encoding = "lua",
      data = {
        65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 0, 0, 0, 0, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66,
        73, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 74, 0, 0, 0, 0, 73, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 74,
        65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 0, 0, 0, 0, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66,
        73, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 74, 0, 0, 0, 0, 73, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 74,
        65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 0, 0, 0, 0, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66,
        73, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 74, 0, 0, 0, 0, 73, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 74,
        65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 0, 0, 0, 0, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66,
        73, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 74, 73, 74, 73, 74, 73, 74, 73, 74, 73, 74, 73, 74, 73, 74, 73, 74, 0, 0, 0, 0, 73, 74, 73, 74, 73, 74, 73, 74, 73, 74, 73, 74, 73, 74, 73, 74, 73, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 74,
        65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66,
        73, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 74, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 73, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 74,
        65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66,
        73, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 74, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 73, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 74,
        65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 0, 0, 0, 0, 67, 68, 67, 68, 67, 68, 0, 81, 82, 81, 82, 81, 82, 81, 82, 81, 82, 81, 82, 81, 82, 0, 67, 68, 67, 68, 67, 68, 0, 0, 0, 0, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66,
        73, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 74, 0, 0, 0, 0, 75, 67, 68, 67, 68, 76, 0, 89, 90, 89, 90, 89, 90, 89, 90, 89, 90, 89, 90, 89, 90, 0, 75, 67, 68, 67, 68, 76, 0, 0, 0, 0, 73, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 74,
        65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 0, 0, 0, 0, 67, 68, 67, 68, 67, 68, 0, 81, 82, 81, 82, 81, 82, 81, 82, 81, 82, 81, 82, 81, 82, 0, 67, 68, 67, 68, 67, 68, 0, 0, 0, 0, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66,
        73, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 74, 0, 0, 0, 0, 75, 67, 68, 67, 68, 76, 0, 89, 90, 89, 90, 89, 90, 89, 90, 89, 90, 89, 90, 89, 90, 0, 75, 67, 68, 67, 68, 76, 0, 0, 0, 0, 73, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 74,
        65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 0, 0, 0, 0, 67, 68, 67, 68, 67, 68, 0, 81, 82, 81, 82, 121, 121, 121, 121, 121, 121, 81, 82, 81, 82, 0, 67, 68, 67, 68, 67, 68, 0, 0, 0, 0, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66,
        73, 74, 73, 74, 73, 74, 73, 74, 73, 74, 73, 74, 73, 74, 0, 0, 0, 0, 75, 76, 75, 76, 75, 76, 0, 89, 90, 89, 90, 124, 124, 0, 0, 69, 0, 89, 90, 89, 90, 0, 75, 76, 75, 76, 75, 76, 0, 0, 0, 0, 73, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 74,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 67, 68, 67, 68, 0, 0, 81, 82, 81, 82, 124, 0, 0, 0, 0, 0, 81, 82, 81, 82, 0, 0, 67, 68, 67, 68, 0, 0, 0, 0, 0, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 75, 76, 75, 76, 0, 0, 89, 90, 89, 90, 0, 0, 0, 0, 0, 0, 89, 90, 89, 90, 0, 0, 75, 76, 75, 76, 0, 0, 0, 0, 0, 73, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 74,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 67, 68, 67, 68, 67, 68, 0, 85, 86, 85, 86, 0, 0, 0, 0, 0, 0, 85, 86, 85, 86, 0, 67, 68, 67, 68, 67, 68, 0, 0, 0, 0, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 75, 76, 75, 76, 75, 76, 0, 93, 94, 93, 94, 0, 0, 0, 0, 0, 0, 93, 94, 93, 94, 0, 75, 76, 75, 76, 75, 76, 0, 0, 0, 0, 73, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 74,
        65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 0, 0, 0, 0, 0, 67, 68, 67, 68, 0, 0, 0, 85, 86, 0, 0, 0, 0, 0, 0, 0, 0, 85, 86, 0, 0, 0, 67, 68, 67, 68, 0, 0, 0, 0, 0, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66,
        73, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 74, 0, 0, 0, 0, 0, 75, 76, 75, 76, 0, 0, 0, 93, 94, 0, 0, 0, 0, 0, 0, 0, 0, 93, 94, 0, 0, 0, 75, 76, 75, 76, 0, 0, 0, 0, 0, 73, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 74,
        65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 0, 0, 0, 0, 0, 0, 67, 68, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 67, 68, 0, 0, 0, 0, 0, 0, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66,
        73, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 74, 0, 0, 0, 0, 67, 68, 75, 76, 67, 68, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 67, 68, 75, 76, 67, 68, 0, 0, 0, 0, 73, 74, 73, 74, 73, 74, 73, 74, 73, 74, 73, 74, 73, 74,
        65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 0, 0, 0, 0, 75, 76, 0, 0, 75, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 75, 76, 0, 0, 75, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        73, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 74, 0, 0, 0, 0, 0, 67, 68, 67, 68, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 67, 68, 67, 68, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 0, 0, 0, 0, 0, 75, 76, 75, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 75, 76, 75, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        73, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 74, 0, 0, 0, 0, 0, 0, 67, 68, 0, 0, 0, 0, 0, 0, 0, 117, 0, 0, 0, 0, 117, 0, 0, 0, 0, 0, 0, 0, 67, 68, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 0, 0, 0, 70, 0, 0, 75, 76, 0, 0, 0, 0, 0, 0, 0, 125, 0, 0, 0, 0, 125, 0, 0, 0, 0, 0, 0, 0, 75, 76, 0, 0, 70, 0, 0, 0, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66,
        73, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 74, 0, 0, 0, 0, 70, 0, 0, 0, 0, 113, 114, 114, 114, 114, 114, 115, 0, 0, 0, 0, 113, 114, 114, 114, 114, 114, 115, 0, 0, 0, 0, 70, 0, 0, 0, 0, 73, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 74,
        65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66,
        73, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 74, 0, 0, 0, 0, 100, 0, 100, 0, 100, 0, 100, 0, 100, 0, 100, 0, 0, 0, 0, 0, 0, 100, 0, 100, 0, 100, 0, 100, 0, 100, 0, 100, 0, 0, 0, 0, 73, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 74,
        65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 0, 0, 0, 0, 108, 0, 108, 0, 108, 0, 108, 0, 108, 0, 108, 0, 0, 0, 0, 0, 0, 108, 0, 108, 0, 108, 0, 108, 0, 108, 0, 108, 0, 0, 0, 0, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66,
        73, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 74, 0, 0, 0, 0, 116, 0, 116, 0, 116, 0, 116, 0, 116, 0, 116, 0, 0, 0, 0, 0, 0, 116, 0, 116, 0, 116, 0, 116, 0, 116, 0, 116, 0, 0, 0, 0, 73, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 74,
        65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66,
        73, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 74, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 73, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 74,
        65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66,
        73, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 74, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 73, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 74,
        65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 0, 0, 0, 0, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66,
        73, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 74, 0, 0, 0, 0, 73, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 74,
        65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 0, 0, 0, 0, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66,
        73, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 74, 0, 0, 0, 0, 73, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 74,
        65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 0, 0, 0, 0, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66,
        73, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 74, 0, 0, 0, 0, 73, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 74,
        65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 0, 0, 0, 0, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66,
        73, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 74, 0, 0, 0, 0, 73, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 74, 73, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 65, 66, 74
      }
    },
    {
      type = "objectgroup",
      name = "Spawn Points",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      draworder = "topdown",
      properties = {},
      objects = {
        {
          id = 1,
          name = "North",
          type = "Spawn",
          shape = "point",
          x = 2048,
          y = 640,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 2,
          name = "West",
          type = "Spawn",
          shape = "point",
          x = 968,
          y = 1278,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 3,
          name = "East",
          type = "Spawn",
          shape = "point",
          x = 3128,
          y = 1800,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 4,
          name = "South",
          type = "Spawn",
          shape = "point",
          x = 1532,
          y = 2494,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 16,
          name = "Start",
          type = "Spawn",
          shape = "point",
          x = 2048,
          y = 1659.67,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      name = "Dialog",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      draworder = "topdown",
      properties = {},
      objects = {
        {
          id = 14,
          name = "Quest",
          type = "Kid",
          shape = "point",
          x = 2115,
          y = 1276,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 18,
          name = "AboutCharging",
          type = "Sign",
          shape = "point",
          x = 2335,
          y = 1589,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 19,
          name = "AboutMovement",
          type = "Sign",
          shape = "point",
          x = 1759.5,
          y = 1587.5,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 20,
          name = "AboutYarn",
          type = "Sign",
          shape = "point",
          x = 2591,
          y = 1780,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 21,
          name = "AboutHealth",
          type = "Sign",
          shape = "point",
          x = 1504.5,
          y = 1777,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
