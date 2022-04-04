<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'guretabadul' );

/** Database username */
define( 'DB_USER', 'tabadul' );

/** Database password */
define( 'DB_PASSWORD', 'z' );

/** Database hostname */
define( 'DB_HOST', 'localhost' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

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
define( 'AUTH_KEY',         'Q.^!& k[4ANGST|he$-G}ilS.7Qx`/c[&Zqr1a!Aq4E<O)]-.h?}4F>{KZ.yT(9L' );
define( 'SECURE_AUTH_KEY',  'y4GF8pq[abYX`;o)hszN_ojiUbKz11/HPoU0GVdse!ciZM.2hC:$5#(p=?Q6F|_#' );
define( 'LOGGED_IN_KEY',    'B/j{Kv2kbq|<KU&?h2Vj+or{yeM(oj,D v(pvP;*}5wVuYN0.j,[qR|8zZX%K7,z' );
define( 'NONCE_KEY',        '7P.Kd/QKt!)KcO84r+tJB8hhIeb$c<Ar;n<zF==*wCQ{B#DQx8mvW}%ur5z9~`|e' );
define( 'AUTH_SALT',        'D^i6N>n-/t^[{1(27?-b/=$MU?Q JP0QyoHy mHaYAYY:.:*FTM(iU!9Io5U._k:' );
define( 'SECURE_AUTH_SALT', 't`F;uhULMh79gfa|sc^3W4%)C]>9n9 V]AcwNK:-09KW%W$}WcfuqNyE IAu H{,' );
define( 'LOGGED_IN_SALT',   'jeY]4NpA[^5BKa[]@4a0MM!tM%U1BB]%LcjHc>Mw?(l,vv3R1ckI*O!fWLY6[^I=' );
define( 'NONCE_SALT',       ',g!MV^;SW{Fo`Rh&o+[|5Q0#8?]C.kG==:H!+MbV(D!,#r-,v) [iOLK10+cl?bP' );

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_sp_';

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
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
