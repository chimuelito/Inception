<?php
/**
 * La configuration de base de votre installation WordPress.
 *
 * Ce fichier est utilisé par le script de création de wp-config.php pendant
 * le processus d’installation. Vous n’avez pas à utiliser le site web, vous
 * pouvez simplement renommer ce fichier en « wp-config.php » et remplir les
 * valeurs.
 *
 * Ce fichier contient les réglages de configuration suivants :
 *
 * Réglages MySQL
 * Préfixe de table
 * Clés secrètes
 * Langue utilisée
 * ABSPATH
 *
 * @link https://fr.wordpress.org/support/article/editing-wp-config-php/.
 *
 * @package WordPress
 */

// ** Réglages MySQL - Votre hébergeur doit vous fournir ces informations. ** //
/** Nom de la base de données de WordPress. */
define( 'DB_NAME', 'wordpress' );

/** Utilisateur de la base de données MySQL. */
define( 'DB_USER', 'wordpress_user' );

/** Mot de passe de la base de données MySQL. */
define( 'DB_PASSWORD', 'wordpress' );

/** Adresse de l’hébergement MySQL. */
define( 'DB_HOST', 'mariadb:3306' );

/** Jeu de caractères à utiliser par la base de données lors de la création des tables. */
define( 'DB_CHARSET', 'utf8' );

/**
 * Type de collation de la base de données.
 * N’y touchez que si vous savez ce que vous faites.
 */
define( 'DB_COLLATE', '' );

/**#@+
 * Clés uniques d’authentification et salage.
 *
 * Remplacez les valeurs par défaut par des phrases uniques !
 * Vous pouvez générer des phrases aléatoires en utilisant
 * {@link https://api.wordpress.org/secret-key/1.1/salt/ le service de clés secrètes de WordPress.org}.
 * Vous pouvez modifier ces phrases à n’importe quel moment, afin d’invalider tous les cookies existants.
 * Cela forcera également tous les utilisateurs à se reconnecter.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'xuY-eMZ+}fy%m~M0$2rOc Q[1oGru1b}pc&/n3!6+C0oyXB$F2[|N,VGM?5HZ~.%');
define('SECURE_AUTH_KEY',  'O[bp3K5(mF&O{vvWAOk;D){?fD}@J>DGa3olnaG$P[?A5TNJi3(*.1|k0.W]KrSS');
define('LOGGED_IN_KEY',    'jAE+(|WoaGSG<:|[.|+6G9S?/wul+1s>->uB}&DNJlFEbC3jok$BLf~y*E(VxIh*');
define('NONCE_KEY',        'Ba<7+&a&[cM:q=7aJ}VpJm`gSe-_:~S?|e*q=IHq?G-0Rh`&A|sE4_x.f6(2iy*N');
define('AUTH_SALT',        '+g0pBa[e2m4pM3~v]1NAr3UzhtX:,H$z`N~h,aK;l<[RV@!i2~R#ChA 7>uc0j#V');
define('SECURE_AUTH_SALT', '!*<m|!B4R4]&OQ6e$Z>vbXK_:?+:zU%{xp{LMq%XPks O 0w%],[gHtMhT%Mbw~-');
define('LOGGED_IN_SALT',   'YSAr[5YGG1xQ/r<kX10x5ik:}`%QbV$0bUcPDzFj10-cN3;~7j&6D#V%0TT|sDbH');
define('NONCE_SALT',       'Y5f6-DSk|Zv :A9DaQ(K,uad+X8ZAXuVV>:N4|-.{F])vr$G+47YJu&We[,%-78z');
/**#@-*/

/**
 * Préfixe de base de données pour les tables de WordPress.
 *
 * Vous pouvez installer plusieurs WordPress sur une seule base de données
 * si vous leur donnez chacune un préfixe unique.
 * N’utilisez que des chiffres, des lettres non-accentuées, et des caractères soulignés !
 */
$table_prefix = 'wp_';

/**
 * Pour les développeurs : le mode déboguage de WordPress.
 *
 * En passant la valeur suivante à "true", vous activez l’affichage des
 * notifications d’erreurs pendant vos essais.
 * Il est fortement recommandé que les développeurs d’extensions et
 * de thèmes se servent de WP_DEBUG dans leur environnement de
 * développement.
 *
 * Pour plus d’information sur les autres constantes qui peuvent être utilisées
 * pour le déboguage, rendez-vous sur le Codex.
 *
 * @link https://fr.wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* C’est tout, ne touchez pas à ce qui suit ! Bonne publication. */

/** Chemin absolu vers le dossier de WordPress. */
if ( ! defined( 'ABSPATH' ) )
  define( 'ABSPATH', dirname( __FILE__ ) . '/' );

/** Réglage des variables de WordPress et de ses fichiers inclus. */
require_once( ABSPATH . 'wp-settings.php' );
