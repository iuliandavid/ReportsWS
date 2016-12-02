package com.id.model;

import lombok.Data;

@Data
public class AuthTokenInfo {
	private String access_token;
	private String token_type;
	private String refresh_token;
	private int expires_in;
	private String scope;
}
