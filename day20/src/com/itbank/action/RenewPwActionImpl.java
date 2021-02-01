package com.itbank.action;

import java.util.Enumeration;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itbank.model.Hash;
import com.itbank.model.MemberDAO;
import com.itbank.model.MemberDTO;

public class RenewPwActionImpl implements CommandAction {

	private MemberDAO dao = MemberDAO.getInstance();
	
	@Override
	public String doGet(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		return "renew";
	}

	@Override
	public String doPost(HttpServletRequest request, HttpServletResponse response) throws Throwable {
//		MemberDTO user = new MemberDTO();
//		user.setUserid(request.getParameter("userid"));
//		user.setUsername(request.getParameter("username"));
//		user.setEmail(request.getParameter("email"));
//		
//		int dto = dao.renewPw(user);
//		request.setAttribute("renew", dto);
//		
//		return "login";
		
//		Enumeration 인터페이스를 구현하는 개체는 일련의 요소를 한 번에 하나씩 생성합니다.
//		다음 요소 메서드에 대한 연속 호출은 시리즈의 연속 요소를 반환합니다.
		Enumeration<String> names = request.getParameterNames();
//		getParameterNames() => 이 요청에 포함된 매개 변수의 이름을 포함하는 Enumeration of String 개체를 반환합니다.
//		요청에 매개 변수가 없는 경우 메서드는 빈 Enumeration을 반환합니다.
		MemberDTO dto = new MemberDTO();
		
		while(names.hasMoreElements()) {	// 이 열거에 더 많은 요소가 포함되어 있는지 테스트합니다.
			String name = names.nextElement();	// 이 열거형 개체에 제공할 요소가 하나 이상 있는 경우 이 열거형의 다음 요소를 반환합니다.
			String value = request.getParameter(name);
			// 반복문으로 받아오는 파라미터를 파악해서 요소가 있다면 name에 담고,
			// value에 request 파라미터 매개변수로 담는다
			switch(name) {
				case "userid": dto.setUserid(value); break;
				// value에 담긴 요소가 userid라면 dto.setUserid("userid");
				case "username": dto.setUsername(value); break;
				case "email": dto.setEmail(value); break;
			}
		}
		String newPassword = UUID.randomUUID().toString().replace("-", "").substring(0, 12);
		// 랜덤의 UUID를 생성해서 toString하고 "-"을 공백으로 바꾼 다음에 12자리만 가져와 newPassword에 담는다
		dto.setUserpw(Hash.getHash(newPassword));
		// 해시처리하여 dto.setUserpw로 세팅
		int row = dao.updatePassword(dto);
		// dao의 updatePassword 함수를 row로
		
		if(row == 1) {
		// row가 1일 때
			request.setAttribute("row", 1);
			// 요청 객체에 row를 1로 세팅하여 보냄
			request.setAttribute("password", newPassword);
			// password를 위에서 랜덤하게 생성한 newPassword로 세팅하여 보냄
		}
		
		return "renewPasswordResult";
		// 결과 jsp 파일로
	}

}
