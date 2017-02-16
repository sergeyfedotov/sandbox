local LOCK_TIMEOUT = 5      -- 5 s
local POLLING_DELAY = 0.01  -- 10 ms

ngx.req.discard_body()

local return_uri = ngx.var.return_uri

local locks = ngx.shared.locks;
local lock_key = ngx.md5_bin(return_uri)
local locked = locks:add(lock_key, true, LOCK_TIMEOUT)

if not locked then
    ngx.sleep(POLLING_DELAY)
    return ngx.exec(return_uri)
end

local full_path, format = ngx.var.full_path, ngx.var.format
local width, height = tonumber(ngx.var.width), tonumber(ngx.var.height)

local img, error = magick.load_image(full_path)

if not img then
    ngx.log(ngx.ERR, error)
else
    local w, h = img:get_width(), img:get_height()
    local scale = math.min(width / w, height / h)

    if img:auto_orient()
        and img:resize(w * scale, h * scale)
        and img:set_interlace_scheme('PlaneInterlace')
        and img:set_quality(85)
        and img:set_format(format)
        and img:strip()
    then
        ngx.print(img:get_blob())
        return ngx.exit(ngx.HTTP_OK)
    end
end

return ngx.exit(ngx.HTTP_INTERNAL_SERVER_ERROR)
