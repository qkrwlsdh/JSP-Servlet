package day21;

import javax.sql.DataSource;

import org.springframework.context.support.GenericXmlApplicationContext;

public class TestDAO {

	private GenericXmlApplicationContext ctx;
	private DataSource ds;
	
	public TestDAO() {
		ctx = new GenericXmlApplicationContext("classpath:ApplicationContext.xml");
		ds = ctx.getBean("ds", DataSource.class);
	}
}
