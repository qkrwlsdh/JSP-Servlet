package day21;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.sql.DataSource;

import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.context.support.GenericXmlApplicationContext;

public class Main {
	public static void main(String[] args) throws Exception {
		// 기존 자바코드에서의 객체 생성 (생성자를 호출하여 객체를 생성한다)
		Greeting g1 = new Greeting();	// 생성자를 호출할 때 마다 새로운 객체가 메모리에 발생한다
		String msg1 = g1.greet("이지은");
		System.out.println(msg1);
		
		// 스프링 컨테이너를 이용하여 객체를 불러오기
		GenericXmlApplicationContext ctx =
				new GenericXmlApplicationContext("classpath:ApplicationContext.xml");
		
		Greeting g2 = ctx.getBean("greet", Greeting.class);	// 이미 생성된 객체를 가져온다
		String msg2 = g2.greet("스프링");	// 스프링 컨테이너의 객체(스프링 빈)은 기본적으로 싱글톤이다
		System.out.println(msg2);
		
		Greeting g3 = ctx.getBean("greet", Greeting.class);
		g3.setFormat("안녕, %s !!");
		String msg3 = g3.greet("Spring");
		System.out.println(msg3);
		
		System.out.println("g1 == g2 : " + (g1 == g2));
		System.out.println("g2 == g3 : " + (g2 == g3));
		
		// DataSource Test
		String sql = "select * from v$version";
		DataSource ds = ctx.getBean("ds", BasicDataSource.class);
		Connection conn = ds.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()) {
			System.out.println(rs.getString(1));
		}
		
		ctx.close();
	}
}
