# nginx image processing with Lua

```php
<?php
define('SECRET', $_ENV['SECRET'] ?? '');
$width = 300;
$height = 300;
$path = '/test';
$format = 'jpg';
$hash = md5($width.$height.$path.$format.SECRET, true);
$sign = rtrim(strtr(base64_encode($hash), '+/', '-_'), '=');
$url = "http://localhost:5000/{$width}x{$height}{$path}.{$sign}.{$format}";
// http://localhost:5000/300x300/test.k_UaaljVaUmnqFI1UDe_0A.jpg
```
