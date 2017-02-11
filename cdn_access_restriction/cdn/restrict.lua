local SECRET = os.getenv('JWT_SECRET')

local u = url.parse(ngx.var.http_referer)
local host = u.host

local key = ngx.var.arg_key
local jwt_obj = jwt:verify(SECRET, key)

if jwt_obj.verified
  and jwt_obj.payload
  and type(jwt_obj.payload.domains) == 'table' then
  for key, value in pairs(jwt_obj.payload.domains) do
    if value == host then
      return
    end
  end
end

ngx.exit(ngx.HTTP_FORBIDDEN)
