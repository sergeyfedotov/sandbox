ngx.req.discard_body()

local full_path, format = ngx.var.full_path, ngx.var.format
local width, height = tonumber(ngx.var.width), tonumber(ngx.var.height)

local img, error = magick.load_image(full_path)
if not img then
    ngx.log(ngx.ERR, error)
    return ngx.exit(415)
end

local w, h = img:get_width(), img:get_height()
local scale = math.min(width / w, height / h)

img:auto_orient()
img:resize(w * scale, h * scale)
img:set_interlace_scheme('PlaneInterlace')
img:set_quality(85)
img:set_format(format)
img:strip()

ngx.print(img:get_blob())
return ngx.exit(ngx.HTTP_OK)
