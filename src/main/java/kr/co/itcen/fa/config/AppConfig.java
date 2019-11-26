package kr.co.itcen.fa.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.context.annotation.Import;

import kr.co.itcen.config.app.DBConfig;
import kr.co.itcen.config.app.MyBatisConfig;

@Configuration
@EnableAspectJAutoProxy
@ComponentScan({"kr.co.itcen.fa.service", "kr.co.itcen.fa.repository", "kr.co.itcen.fa.aspect"})
@Import({DBConfig.class, MyBatisConfig.class})
public class AppConfig {
}
