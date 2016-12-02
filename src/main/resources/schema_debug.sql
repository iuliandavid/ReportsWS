CREATE TABLE `authorities_ws` (
    `username_ws` VARCHAR(255) NOT NULL,
    `authority_ws` VARCHAR(255) NOT NULL,
    INDEX `username` (`username_ws`),
    INDEX `authority` (`authority_ws`)
)
COLLATE='utf8_general_ci'
ENGINE=MyISAM;

INSERT INTO `authorities_ws` (`username_ws`, `authority_ws`) VALUES ('bob', 'USER');
INSERT INTO `authorities_ws` (`username_ws`, `authority_ws`) VALUES ('mike', 'USER');

CREATE TABLE `users_ws` (
    `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
    `username_ws` VARCHAR(255) NULL DEFAULT NULL,
    `password_ws` VARCHAR(255) NULL DEFAULT NULL,
    `enabled` TINYINT(1) NULL DEFAULT NULL,
    PRIMARY KEY (`id`)
)
COLLATE='utf8_general_ci'
ENGINE=MyISAM;

INSERT INTO `users_ws` (`username_ws`, `password_ws`, `enabled`) VALUES ('bob', 'bobs_auth', 1);
INSERT INTO `users_ws` (`username_ws`, `password_ws`, `enabled`) VALUES ('mike', 'mikes_auth', 1);

CREATE TABLE `oauth_client_details` (
    `client_id` VARCHAR(255) NOT NULL,
    `resource_ids` VARCHAR(255) NULL DEFAULT NULL,
    `client_secret` VARCHAR(255) NULL DEFAULT NULL,
    `scope` VARCHAR(255) NULL DEFAULT NULL,
    `authorized_grant_types` VARCHAR(255) NULL DEFAULT NULL,
    `web_server_redirect_uri` VARCHAR(255) NULL DEFAULT NULL,
    `authorities` VARCHAR(255) NULL DEFAULT NULL,
    `access_token_validity` INT(11) NULL DEFAULT NULL,
    `refresh_token_validity` INT(11) NULL DEFAULT NULL,
    `additional_information` VARCHAR(4096) NULL DEFAULT NULL,
    `autoapprove` VARCHAR(255) NULL DEFAULT NULL,
    PRIMARY KEY (`client_id`)
)
COLLATE='utf8_general_ci'
ENGINE=MyISAM;


INSERT INTO `oauth_client_details` (`client_id`, `resource_ids`, `client_secret`, `scope`, 
`authorized_grant_types`, `web_server_redirect_uri`, `authorities`, `access_token_validity`, 
`refresh_token_validity`, `additional_information`, `autoapprove`) 
VALUES ('ios', '', 'iosSecret', 'read,write,trust', 'password,authorization_code,refresh_token,implicit', '', 'USER', 600, 5184000, '{}', '');

INSERT INTO `oauth_client_details` (`client_id`, `resource_ids`, `client_secret`, `scope`, 
`authorized_grant_types`, `web_server_redirect_uri`, `authorities`, `access_token_validity`, 
`refresh_token_validity`, `additional_information`, `autoapprove`) 
VALUES ('android', '', 'androidSecret', 'read,write,trust', 'password,authorization_code,refresh_token,implicit', '', 'USER', 600, 5184000, '{}', '');


CREATE TABLE `oauth_refresh_token` (
    `token_id` VARCHAR(255) NULL DEFAULT NULL,
    `token` MEDIUMBLOB NULL,
    `authentication` MEDIUMBLOB NULL
)
COLLATE='utf8_general_ci'
ENGINE=MyISAM;


CREATE TABLE `oauth_access_token` (
    `token_id` VARCHAR(255) NULL DEFAULT NULL,
    `token` MEDIUMBLOB NULL,
    `authentication_id` VARCHAR(255) NOT NULL,
    `user_name` VARCHAR(255) NULL DEFAULT NULL,
    `client_id` VARCHAR(255) NULL DEFAULT NULL,
    `authentication` MEDIUMBLOB NULL,
    `refresh_token` VARCHAR(255) NULL DEFAULT NULL,
    PRIMARY KEY (`authentication_id`)
)
COLLATE='utf8_general_ci'
ENGINE=MyISAM;