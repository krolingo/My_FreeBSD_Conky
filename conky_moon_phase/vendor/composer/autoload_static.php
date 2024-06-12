<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInit9e122c509b788442ca863fb1ee95d277
{
    public static $prefixLengthsPsr4 = array (
        'S' => 
        array (
            'Solaris\\' => 8,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'Solaris\\' => 
        array (
            0 => __DIR__ . '/..' . '/solaris/php-moon-phase/src',
        ),
    );

    public static $classMap = array (
        'Composer\\InstalledVersions' => __DIR__ . '/..' . '/composer/InstalledVersions.php',
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInit9e122c509b788442ca863fb1ee95d277::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInit9e122c509b788442ca863fb1ee95d277::$prefixDirsPsr4;
            $loader->classMap = ComposerStaticInit9e122c509b788442ca863fb1ee95d277::$classMap;

        }, null, ClassLoader::class);
    }
}
