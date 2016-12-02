/**
 * 
 */
package com.id.security;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.security.oauth2.common.DefaultOAuth2AccessToken;
import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.security.oauth2.provider.token.store.JdbcTokenStore;

/**
 * @author iulian
 *
 */
public class MysqlTokenStore extends JdbcTokenStore {

	private final static Logger LOG = LoggerFactory.getLogger(MysqlTokenStore.class);
	
	/**
	 * @param dataSource
	 */
	public MysqlTokenStore(DataSource dataSource) {
		super(dataSource);
	}
	
	@Override
	public OAuth2AccessToken readAccessToken(String tokenValue) {
		 OAuth2AccessToken accessToken = null;

		    try {
		        accessToken = new DefaultOAuth2AccessToken(tokenValue);
		    }
		    catch (EmptyResultDataAccessException e) {
		       // if (LOG.isInfoEnabled()) {
		            LOG.info("Failed to find access token for token "+tokenValue);
//		        }
		    }
		    catch (IllegalArgumentException e) {
		        LOG.info("Failed to deserialize access token for " +tokenValue,e);
		        removeAccessToken(tokenValue);
		    }

		    return accessToken;
	}

}
