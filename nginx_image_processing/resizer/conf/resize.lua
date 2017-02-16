local LOCK_TIMEOUT = 0.5    -- 0.5 s
local POLLING_DELAY = 0.05  -- 50 ms

ngx.req.discard_body()

local cache = ngx.shared.cache;
local cache_key = ngx.md5_bin(ngx.var.uri)

while true do
    local cached = cache:get(cache_key)
    if cached then
        ngx.print(cached)
        return ngx.exit(ngx.HTTP_OK)
    end

    local locked = cache:add(cache_key, false, LOCK_TIMEOUT)
    if locked then
        break
    end

    ngx.sleep(POLLING_DELAY)
end

local full_path, format = ngx.var.full_path, ngx.var.format
local width, height = tonumber(ngx.var.width), tonumber(ngx.var.height)

local img, err = magick.load_image(full_path)
assert(img, err)

local w, h = img:get_width(), img:get_height()
assert(w and w > 0)
assert(h and h > 0)

local scale = math.min(width / w, height / h)

assert(img:auto_orient())
assert(img:resize(w * scale, h * scale))
assert(img:set_interlace_scheme('PlaneInterlace'))
assert(img:set_quality(85))
assert(img:set_format(format))
assert(img:strip())

cache:set(cache_key, img:get_blob())

ngx.print(img:get_blob())
return ngx.exit(ngx.HTTP_OK)
