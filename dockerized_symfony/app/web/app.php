<?php

use Symfony\Component\Debug\Debug;
use Symfony\Component\HttpFoundation\Request;

/** @var \Composer\Autoload\ClassLoader $loader */
$loader = require __DIR__.'/../app/autoload.php';
include_once __DIR__.'/../var/bootstrap.php.cache';

$env = getenv('SYMFONY_ENV') ?: 'prod';
$debug = filter_var(getenv('SYMFONY_DEBUG') ?: 'dev' === $env, FILTER_VALIDATE_BOOLEAN);

if ($debug) {
    Debug::enable();
}

$kernel = new AppKernel($env, $debug);
$request = Request::createFromGlobals();
$response = $kernel->handle($request);
$response->send();
$kernel->terminate($request, $response);
