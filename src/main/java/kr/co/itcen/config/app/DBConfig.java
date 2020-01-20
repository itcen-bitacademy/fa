package kr.co.itcen.config.app;

import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableTransactionManagement
@PropertySource("classpath:kr/co/itcen/config/app/properties/jdbc.properties")
public class DBConfig {
	
	@Autowired
	Environment env;
	
	@Bean
	public DataSource dataSource() {
		BasicDataSource basicDataSource = new BasicDataSource(); 
		basicDataSource.setDriverClassName(env.getProperty("jdbc.driverClassName"));
		basicDataSource.setUrl(env.getProperty("jdbc.url"));
		basicDataSource.setUsername(env.getProperty("jdbc.username"));
		basicDataSource.setPassword(env.getProperty("jdbc.password"));
		basicDataSource.setTestOnBorrow(true);
		basicDataSource.setValidationQuery(env.getProperty("jdbc.validationQuery"));
		basicDataSource.setInitialSize(env.getProperty("jdbc.initialSize", Integer.class));
		basicDataSource.setMaxActive(env.getProperty("jdbc.maxActive", Integer.class));
		return basicDataSource;
	}

	@Bean
	public PlatformTransactionManager transactionManager(DataSource dataSource) {
		return new DataSourceTransactionManager(dataSource);
	}
}
