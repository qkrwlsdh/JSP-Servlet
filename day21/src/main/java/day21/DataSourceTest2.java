package day21;

import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.context.support.GenericXmlApplicationContext;

import java.sql.*;

public class DataSourceTest2 {	// Spring Container, Dependency Injection, Inversion of Control
	public static void main(String[] args) throws Exception {
		
		GenericXmlApplicationContext ctx =
				new GenericXmlApplicationContext("classpath:ApplicationContext.xml");
		// 스프링 컨테이너를 불러오는 작업도 이후 자동화된다
		
		BasicDataSource ds = ctx.getBean("ds", BasicDataSource.class);	// 싱글톤, 속성 준비가 모두 끝난 객체
		
		String sql = "select * from v$version";
		
		Connection conn = ds.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()) {
			System.out.println(rs.getString(1));
		}
		rs.close();
		stmt.close();
		conn.close();
		ds.close();
		ctx.close();
	}
}
