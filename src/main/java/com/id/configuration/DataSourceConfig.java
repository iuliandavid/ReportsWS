package com.id.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

@Configuration
@PropertySource("classpath:application.properties")
public class DataSourceConfig {
	
	@Autowired
	private Environment env;

	
	@Bean
	public DriverManagerDataSource createDataSource() {

		DriverManagerDataSource driverManagerDataSource = new DriverManagerDataSource();
		String driverClassName = "com.mysql.jdbc.Driver";
		driverClassName = env.getProperty("db.driver");
		driverManagerDataSource.setDriverClassName(driverClassName);
		String dbURL = env.getProperty("db.url");
		driverManagerDataSource.setUrl(dbURL);
		String dbUsername = env.getProperty("db.username");
		driverManagerDataSource.setUsername(dbUsername);
		
		String dbPassword = env.getProperty("db.password");
		driverManagerDataSource.setPassword(dbPassword);

		return driverManagerDataSource;
	}

}
