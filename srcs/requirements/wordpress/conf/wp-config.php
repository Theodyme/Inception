<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the website, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://developer.wordpress.org/advanced-administration/wordpress/wp-config/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', '${DB_NAME}' );

/** Database username */
define( 'DB_USER', '${DB_USR}' );

/** Database password */
define( 'DB_PASSWORD', '${DB_PWD}' );

/** Database hostname */
define( 'DB_HOST', 'mariadb:3306' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */

define('AUTH_KEY',         'C]h9i|~Lk0F)P@b-+K)T_svuu8Ds76tTX~Ov+jM-&Lg5i<pAkp)4I@70|i(h < n');
define('SECURE_AUTH_KEY',  'T])@Tyc-,lesOYzqaemo6j|n0KT;{6s9/!]<^cAp8]+HJ:s:h}l8L0q}wQ7+jn^F');
define('LOGGED_IN_KEY',    'H5;R!+.{<*{o-ri3y}EfE.lao{MgLVBz{#MHhj&%3=E.>3{ypu?L#z^2LPN18(V+');
define('NONCE_KEY',        '^kr`Y>O2!g>-RpXcm_R$Q|uNSE;O%+dCG)e_&GDnhc+]4&UWGmlHzM[[B8/V?teF');
define('AUTH_SALT',        's4+1s]?W+exw@z2q4cJh+[sngLl!a1h=KZWB`?;^gSnxE6Z*Cz;Go-rUmv][;E;&');
define('SECURE_AUTH_SALT', 'sTKc5xU+`g}_gT[`o CkfADe^zsT+G!]W2=W?Z1-{-E%`]@B_;.Z8zOlxXI-T(e6');
define('LOGGED_IN_SALT',   '?xU!o)kSA7gHGfs,~)_J/B|V/ieJndBRNehcKDjvnLfgCMw3>jQb}>iXT7Ry,L>_');
define('NONCE_SALT',       '$j~ql Z-[yl,VVbF,yZ==C-hwIV~qvz<>mRO`dW>H^n`?X;YPiq!,vYFJ<;R{}w4');

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://developer.wordpress.org/advanced-administration/debug/debug-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */

define( 'DISABLE_WP_CRON', true );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
